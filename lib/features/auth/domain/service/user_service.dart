import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  late final Ref _ref;

  FirebaseAuth get _firebaseAuth => _ref.watch(firebaseAuthProvider);
  UserService(this._ref);

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

  Future<CubeUser?> createCubeUserFromFirebase() async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user == null) {
        return null;
      }

      String? email = user.email;
      String? displayName = user.displayName;
      String? photoUrl = user.photoURL;
      String? phoneNumber = user.phoneNumber;
      String? uid = user.uid;

      if (email == null || displayName == null || photoUrl == null) {
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
}
