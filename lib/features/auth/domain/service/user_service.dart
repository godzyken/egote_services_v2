import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase;

import '../../../../config/providers/supabase/supabase_providers.dart';

part 'user_service.g.dart';

@riverpod
class FirebaseAuthService extends _$FirebaseAuthService {
  late final supabase.SupabaseClient _supabaseClient;

  late FirebaseAuth _firebaseAuth;

  FirebaseAuthService() : supabaseAuthService = AsyncValue.loading();

  FirebaseAuthService.createCubeUser({required this.supabaseAuthService}) {
    _supabaseClient = ref.watch(supabaseClientProvider);

    final currentUser = _supabaseClient.auth.currentUser;

    if (currentUser != null) {
      final cubeUser = CubeUser(
        id: int.tryParse(currentUser.id),
        login: currentUser.email,
        email: currentUser.email,
        fullName: currentUser.userMetadata?['full_name'],
        avatar: currentUser.userMetadata?['avatar_url'],
      );

      supabaseAuthService = AsyncValue.data(cubeUser);
    } else {
      supabaseAuthService = AsyncValue.data(null);
    }
  }

  late final AsyncValue<CubeUser?> supabaseAuthService;

  AsyncValue<CubeUser?> get getCubeUser => supabaseAuthService;

  @override
  Future<CubeUser?> build() async {
    _supabaseClient = ref.read(supabaseClientProvider);
    _firebaseAuth = ref.read(firebaseAuthProvider);
    await signInAnonymous();
    return createCubeUserFromFirebase();
  }

  Future<CubeUser?> createCubeUserFromFirebase() async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user == null) {
        developer.log("Aucun utilisateur connecté");
        return null;
      }

      String? email = user.email;
      String? displayName = user.displayName;
      String? photoUrl = user.photoURL;
      String? phoneNumber = user.phoneNumber;
      String? uid = user.uid;

      if (email == null || displayName == null || photoUrl == null) {
        developer.log("Données incomplètes pour créer un CubeUser");
        return null;
      }

      CubeUser cubeUser = CubeUser(
        id: int.tryParse(uid),
        login: email,
        email: email,
        fullName: displayName,
        avatar: photoUrl,
        phone: phoneNumber,
        isGuest: false,
        externalId: int.tryParse(uid),
      );

      return cubeUser;
    } on FirebaseAuthException catch (e) {
      // En cas d'erreur spécifique à FirebaseAuth, on retourne null et log l'erreur
      developer.log("Erreur FirebaseAuth: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      // En cas d'autres erreurs, on les log
      developer.log("Erreur lors de la création du CubeUser: $e");
      return null;
    }
  }

  Future<User> signInAnonymous() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      if (user != null) {
        developer.log("Utilisateur anonyme connecté: ${user.uid}");
        return user;
      } else {
        developer.log("Aucun utilisateur anonyme connecté");
        return Future.error("Aucun utilisateur anonyme connecté");
      }
      supabaseAuthService = AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      developer.log("Erreur de connexion anonyme: ${e.code} - ${e.message}");
      return Future.error(
          "Erreur de connexion anonyme: ${e.code} - ${e.message}");
    } catch (e) {
      developer.log("Erreur lors de la connexion anonyme: $e");
      return Future.error("Erreur lors de la connexion anonyme: $e");
    }
  }

  // Fonction pour mettre à jour les informations d'un CubeUser
  Future<CubeUser?> updateCubeUser({
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user == null) {
        // Si aucun utilisateur n'est connecté, on retourne null
        return null;
      }

      // Si de nouvelles valeurs sont passées, on les applique
      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }
      if (photoUrl != null) {
        await user.updatePhotoURL(photoUrl);
      }
      if (phoneNumber != null) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: phoneNumber, smsCode: '');
        await user.updatePhoneNumber(credential);
      }

      // Appliquer les modifications sur l'utilisateur actuel
      await user.updateProfile(displayName: displayName, photoURL: photoUrl);

      // Récupérer les informations mises à jour
      user = _firebaseAuth.currentUser;

      // Vérification et création du CubeUser mis à jour
      return CubeUser(
        id: int.tryParse(user?.uid ?? '0'),
        login: user?.email,
        email: user?.email,
        fullName: user?.displayName,
        avatar: user?.photoURL,
        phone: user?.phoneNumber,
        isGuest: false,
        externalId: int.tryParse(user?.uid ?? '0'),
      );
    } on FirebaseAuthException catch (e) {
      // En cas d'erreur Firebase
      developer.log(
          "Erreur de mise à jour de FirebaseAuth: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      // En cas d'autres erreurs
      developer.log("Erreur lors de la mise à jour du CubeUser: $e");
      return null;
    }
  }

  Future<bool> verifyPhoneAuthentication(
      String token, String code, String verificationId) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+44 7123 123 456',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Le code de vérification a été complété
          developer.log("Code de vérification complété");
          if (credential.smsCode != null) {
            developer.log("Code de vérification: ${credential.smsCode}");
            await _firebaseAuth.signInWithCredential(credential);
          } else {
            if (credential.verificationId != null) {
              developer.log("VerificationId: ${credential.verificationId}");
              verificationId = credential.verificationId!;
              if (credential.smsCode != null) {
                developer.log("Code de vérification: ${credential.smsCode}");
                await _firebaseAuth.signInWithCredential(credential);
              } else {
                developer.log("Code de vérification non disponible");
              }
            }
          }
        },
        verificationFailed: (FirebaseAuthException e) async {
          switch (e.code) {
            case 'invalid-phone-number':
              // Le numéro de téléphone est invalide
              developer.log("Numéro de téléphone invalide: ${e.message}");
              break;

            case 'invalid-verification-code':
              // Le code de vérification est invalide
              developer.log("Code de vérification invalide: ${e.message}");
              break;

            case 'invalid-verification-id':
              // L'identifiant de vérification est invalide
              developer
                  .log("Identifiant de vérification invalide: ${e.message}");
              break;

            case 'invalid-credential':
              // Les informations de l'authentification sont invalides
              developer.log(
                  "Informations d'authentification invalides: ${e.message}");
              break;
            default:
              developer.log("Erreur Firebase: ${e.message}");
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Le code de vérification a été envoyé avec succès
          developer.log("Code de vérification envoyé avec succès");
          developer.log("VerificationId: $verificationId");
          developer.log("ResendToken: $resendToken");
          verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  // Méthode pour vérifier le code SMS
  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    try {
      // Créez un objet PhoneAuthCredential avec le code SMS et l'ID de vérification
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Utilisez la méthode signInWithCredential pour vous connecter
      await _firebaseAuth.signInWithCredential(credential);
      developer.log("Authentification réussie");
      // Naviguez vers l'écran d'accueil ou un autre écran
    } catch (e) {
      developer.log("Erreur lors de la vérification du code SMS: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();

    supabaseAuthService = AsyncValue.data(null);
  }

  Future<void> deleteAccount() async {
    await _firebaseAuth.currentUser?.delete();

    supabaseAuthService = AsyncValue.data(null);
  }

  Future<void> updatePassword(String newPassword) async {
    await _firebaseAuth.currentUser?.updatePassword(newPassword);
  }

  Future<void> verifyBeforeUpdateEmail(String newEmail) async {
    await _firebaseAuth.currentUser?.verifyBeforeUpdateEmail(newEmail);
  }
}
