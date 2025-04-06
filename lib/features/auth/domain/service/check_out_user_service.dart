import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/service/firebase_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/supabase_auth_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/user_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/verification_all_user_check_out_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../config/pigeon/dart_api.g.dart';
import 'auth_service.dart';

abstract class CheckOutUserService {
  Future<List<CubeUser>> get getAll;

  Future<CubeUser?> get getById;

  Future<CubeUser?> get getByLogin;

  Future<CubeUser?> get getByEmail;

  Future<CubeUser?> createCubeUserFromFirebase();

  Future<CubeUser?> updateCubeUser({
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
  });

  Future<bool> verifyPhoneAuthentication();

  Future<bool> sendMessage(MessageData message);

  Future<String> getHostLanguage();

  Future<List<MessageData?>> search(String keyword);

  Future<int> add(int a, int b);

  Future<void> verifySmsCode(String verificationId, String smsCode);

  Future<void> linkAccount(supabase.OAuthProvider provider);

  Future<void> signInWithOAuth(supabase.OAuthProvider provider);

  Future<void> signOut();

  Future<void> logOut();

  // Future<void> sendPasswordResetEmail(String email);

  Future<void> updatePassword(String newPassword);

  Future<void> login(String email, String password);

  Future<void> register(String email, String password);

  Future<void> forgotPassword(String email);

  Future<void> changePassword(String oldPassword, String newPassword);

  Future<void> updateProfile(String name, String phone);

  Future<void> updateEmail(String newEmail);

  Future<void> updatePhone(String newPhone);

  Future<void> updatePhoto(String newPhoto);

  Future<void> updateAddress(String newAddress);

  Future<void> updateBio(String newBio);

  Future<void> updateWebsite(String newWebsite);

  Future<void> getFirebaseData(String message);

  factory CheckOutUserService.fromFirebaseAuthService(
      FirebaseAuthService service,
      SupabaseAuthService supabaseAuthService,
      AuthService authService,
      FirebaseService firebaseService) {
    return VerifAllUserCheckOutService(
        service, supabaseAuthService, authService, firebaseService);
  }
}
