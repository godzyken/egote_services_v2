import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/pigeon/dart_api.g.dart';
import 'package:egote_services_v2/features/auth/domain/service/check_out_user_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/firebase_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/supabase_auth_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'auth_service.dart';

class VerifAllUserCheckOutService implements CheckOutUserService {
  final FirebaseAuthService userService;
  final SupabaseAuthService supabaseAuthService;

  final AuthService authService;
  final FirebaseService firebaseService;

  VerifAllUserCheckOutService(this.userService, this.supabaseAuthService,
      this.authService, this.firebaseService);

  @override
  // TODO: implement getAll
  Future<List<CubeUser>> get getAll => throw UnimplementedError();

  @override
  // TODO: implement getByEmail
  Future<CubeUser?> get getByEmail => throw UnimplementedError();

  @override
  // TODO: implement getById
  Future<CubeUser?> get getById => throw UnimplementedError();

  @override
  // TODO: implement getByLogin
  Future<CubeUser?> get getByLogin => throw UnimplementedError();

  @override
  Future<CubeUser?> createCubeUserFromFirebase() async {
    return await userService.createCubeUserFromFirebase();
  }

  @override
  Future<void> linkAccount(supabase.OAuthProvider provider) async {
    return await supabaseAuthService.linkAccount(provider);
  }

  @override
  Future<void> signInWithOAuth(supabase.OAuthProvider provider) async {
    return await supabaseAuthService.signInWithOAuth(provider,
        redirectUrl: 'https://www.google.com');
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<CubeUser?> updateCubeUser(
      {String? displayName, String? photoUrl, String? phoneNumber}) {
    // TODO: implement updateCubeUser
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyPhoneAuthentication() {
    // TODO: implement verifyPhoneAuthentication
    throw UnimplementedError();
  }

  @override
  Future<void> verifySmsCode(String verificationId, String smsCode) {
    // TODO: implement verifySmsCode
    throw UnimplementedError();
  }

  @override
  Future<int> add(int a, int b) async {
    return await authService.add(a, b);
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    return await authService.changePassword(oldPassword, newPassword);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await authService.forgotPassword(email);
  }

  @override
  Future<String> getHostLanguage() async {
    return await authService.getHostLanguage();
  }

  @override
  Future<void> logOut() async {
    return await authService.logout();
  }

  @override
  Future<String> login(String email, String password) async {
    return await authService.login(email, password);
  }

  @override
  Future<void> register(String email, String password) async {
    return await authService.register(email, password);
  }

  @override
  Future<List<MessageData?>> search(String keyword) async {
    return await authService.search(keyword);
  }

  @override
  Future<bool> sendMessage(MessageData message) async {
    return await authService.sendMessage(message);
  }

  /* @override
  Future<void> sendPasswordResetEmail(String email) async {
    return await authService.sendPasswordResetEmail(email);
  }
*/
  @override
  Future<void> updateAddress(String newAddress) async {
    return await authService.updateAddress(newAddress);
  }

  @override
  Future<void> updateBio(String newBio) async {
    return await authService.updateBio(newBio);
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    return await authService.updateEmail(newEmail);
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    return await authService.updatePassword(newPassword);
  }

  @override
  Future<void> updatePhone(String newPhone) async {
    return await authService.updatePhone(newPhone);
  }

  @override
  Future<void> updatePhoto(String newPhoto) async {
    return await authService.updatePhoto(newPhoto);
  }

  @override
  Future<void> updateProfile(String name, String phone) async {
    return await authService.updateProfile(name, phone);
  }

  @override
  Future<void> updateWebsite(String newWebsite) async {
    return await authService.updateWebsite(newWebsite);
  }

  @override
  Future<String> getFirebaseData(String message) async {
    return await firebaseService.getFirebaseData(message);
  }
}
