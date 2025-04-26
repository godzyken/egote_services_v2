import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/firebase/firebase_providers.dart';

class UserFirebaseRepository {
  final Ref _ref;

  UserFirebaseRepository({required Ref ref}) : _ref = ref;

  FirebaseApp? get firebaseApp => _ref.read(firebaseInitProvider).value;

  Future<UserEntityModel?> fetchCurrentUserEntity() async {
    final userId = _getCurrentUserId();

    final doc = await _ref
        .watch(firebaseFirestoreProvider(firebaseApp!))
        .collection('users')
        .doc(userId)
        .get();

    if (doc.exists && doc.id == userId) {
      final userData = doc.data() as Map<String, dynamic>;
      return UserEntityModel.fromMap(userData);
    } else {
      return null;
    }
  }

  Future<UserEntityModel?> updateUserName(
      String userId, String fullName) async {
    final docRef = _ref
        .watch(firebaseFirestoreProvider(firebaseApp!))
        .collection('users')
        .doc(userId);
    await docRef.update({'fullName': fullName});

    final updated = await docRef.get();
    if (updated.exists && updated.id == userId) {
      final userData = updated.data() as Map<String, dynamic>;
      return UserEntityModel.fromMap(userData);
    } else {
      return null;
    }
  }

  String _getCurrentUserId() {
    final user = _ref.read(firebaseAuthProvider(firebaseApp!)).currentUser;
    if (user == null) {
      throw Exception('Aucun utilisateur connecté');
    }
    return user.uid;
  }

  CubeUser buildCubeUser(User firebaseUser) {
    return CubeUser(
        id: firebaseUser.uid.hashCode,
        login: firebaseUser.email,
        password: "secure-generated-password",
        avatar: firebaseUser.photoURL,
        fullName: firebaseUser.displayName);
  }
}

final userFirebaseRepositoryProvider = Provider<UserFirebaseRepository>((ref) {
  return UserFirebaseRepository(ref: ref);
});
