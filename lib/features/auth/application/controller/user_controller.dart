import 'dart:developer' as developer;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/firedatabase/user_firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase_auth_ui;

import '../../../../config/providers/watchdog/datadog_logger_helper.dart';

final userControllerProvider = Provider<UserController>((ref) {
  final logger = ref.read(datadogLoggerHelperProvider);
  final supabase = ref.watch(supabaseClientProvider);
  return UserController(logger: logger, supabase: supabase);
});

class UserController {
  final DatadogLoggerHelper logger;
  final supabase_auth_ui.SupabaseClient supabase;
  final firestore = FirebaseFirestore.instance;

  UserController({
    required this.logger,
    required this.supabase,
  });

  Future<UserEntityModel> loadUserProfile(String userId) async {
    logger.info('🔄 Start loading user profile...', extra: {'userId': userId});

    // trace + RUM resource pour Datadog, + span Sentry
    return await logger.trace('load-user-profile', () async {
      return await logger.trackApiCall('load-user-profile', () async {
        try {
          final res = await supabase
              .from('auth_users_table')
              .select()
              .eq('id', userId)
              .single();

          if (res.isEmpty) {
            throw Exception('No user found');
          }

          developer.log('👤 User loaded: ${res['name']}');
          logger.info('✅ User loaded', extra: {
            'userId': userId,
            'username': res['name'],
          });

          return UserEntityModel.fromMap(res);
        } on supabase_auth_ui.PostgrestException catch (e, stack) {
          logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        }
      });
    });
  }

  Future<UserEntityModel> ensureUserProfileExists(
      firebase_auth.User firebaseUser) async {
    logger.info('🔄 Start ensuring user profile exists...',
        extra: {'userId': firebaseUser.uid});
    final userId = firebaseUser.uid;

    return await logger.trace('ensure-user-profile-exists', () async {
      return await logger.trackApiCall('ensure-user-profile-exists', () async {
        try {
          final res = await supabase
              .from('auth_users_table')
              .select()
              .eq('id', userId)
              .maybeSingle();
          if (res!.isNotEmpty) {
            logger.info('✅ User found', extra: {'userId': userId});
            return UserEntityModel.fromMap(res);
          }

          final newUser = UserEntityModel(
            id: UserId(value: int.parse(userId)),
            name: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            createdAt: DateTime.parse(
                firebaseUser.metadata.creationTime!.timeZoneName),
            avatarUrl: firebaseUser.photoURL ?? '',
            role: '',
            externalId: firebaseUser.tenantId ?? '',
            phone: firebaseUser.phoneNumber ?? '',
            externalLink: firebaseUser.providerData.first.providerId,
            isComplete: !firebaseUser.isAnonymous,
            updatedAt: DateTime.parse(
                firebaseUser.metadata.lastSignInTime!.timeZoneName),
            emailConfirmedAt: DateTime.parse(
                firebaseUser.metadata.creationTime!.timeZoneName),
            phoneConfirmedAt: DateTime.parse(
                firebaseUser.metadata.creationTime!.timeZoneName),
            lastSignInAt: DateTime.parse(
                firebaseUser.metadata.lastSignInTime!.timeZoneName),
          );

          await supabase.from('auth_users_table').insert(newUser.toJson());
          logger.info('✅ User created', extra: {'userId': userId});
          return newUser;
        } on supabase_auth_ui.PostgrestException catch (e, stack) {
          logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        }
      });
    });
  }

  Future<void> updateUserProfile(String userId, UserEntityModel user) async {
    logger.info('🔄 Start updating user profile...', extra: {'userId': userId});

    return await logger.trace('update-user-profile', () async {
      return await logger.trackApiCall('update-user-profile', () async {
        try {
          final res = await supabase
              .from('auth_users_table')
              .update(user.toJson())
              .eq('id', userId);
          if (res.isEmpty) {
            throw Exception('No user found');
          }
          logger.info('✅ User updated', extra: {
            'userId': userId,
            'username': user.name,
          });
        } on supabase_auth_ui.PostgrestException catch (e, stack) {
          logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        }
      });
    });
  }

  Future<String> uploadUserAvatar(
      {required String userId, required File avatar}) async {
    final storagePath = 'avatars/$userId/avatar.jpg';
    final supadb = await supabase.storage.from('auth_users_table').upload(
        storagePath, avatar,
        fileOptions: const supabase_auth_ui.FileOptions(upsert: true));
    if (supadb.isEmpty) {
      throw Exception('Error uploading avatar');
    }
    logger.info('✅ Avatar uploaded', extra: {
      'userId': userId,
      'avatarUrl': supadb,
    });

    final url =
        supabase.storage.from('auth_users_table').getPublicUrl(storagePath);
    return url;
  }

  Future<bool> checkCubeUserExists(String userId) async {
    logger
        .info('🔄 Start checking if user exists...', extra: {'userId': userId});
    final doc = await firestore.collection('users').doc(userId).get();

    return doc.exists;
  }

  Future<void> createCubeUserFromFirebaseUser(firebase_auth.User user) async {
    logger.info('🔄 Start creating user...', extra: {'userId': user.uid});
    final userData = {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'createdAt': DateTime.now(),
      'isMfaVerified': false,
      'isComplete': false,
    };
    await firestore.collection('users').doc(user.uid).set(userData);
    logger.info('✅ User created', extra: {'userId': user.uid});
  }

  Future<CubeUser> fetchUser(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    if (!doc.exists) {
      throw Exception('User not found');
    }
    return CubeUser.fromJson(doc.data()!);
  }

  Future<void> markMfaVerified(String userId) async {
    logger.info('🔄 Start marking MFA verified...', extra: {'userId': userId});
    await supabase
        .from('auth_users_table')
        .update({'isMfaVerified': true}).eq('uid', userId);
  }

  Future<void> markProfileComplete(String uid) async {
    await supabase
        .from('auth_users_table')
        .update({'isComplete': true}).eq('uid', uid);
  }

  Future<void> completeUserProfile({
    required String uid,
    required String name,
  }) async {
    final client = supabase;

    await client.from('users').update({
      'name': name,
      'is_complete': true,
    }).eq('id', uid);

    // Optionnel : Refresh session si besoin
    await client.auth.refreshSession();
  }
}

final currentUserProfileProvider = FutureProvider<UserEntityModel>((ref) async {
  final firebaseUser = ref.watch(authStreamProvider).value;

  if (firebaseUser == null) {
    throw Exception('User not authenticated');
  }
  final userController = ref.read(userControllerProvider);
  return await userController.ensureUserProfileExists(firebaseUser);
});

// userEntityModelProvider
final userEntityModelProvider = FutureProvider<UserEntityModel?>((ref) async {
  // récupère depuis Firestore / REST / etc.
  final repo = ref.watch(userFirebaseRepositoryProvider);
  return await repo.fetchCurrentUserEntity();
});

final firebaseUserProvider = StreamProvider<firebase_auth.User?>((ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  final auth = ref.watch(firebaseAuthProvider(firebaseApp));
  return auth.authStateChanges();
});

final isLoadingProvider = StateProvider<bool>((ref) => false);

final selectedAvatarProvider = StateProvider<File?>((ref) => null);

class UpdateUserNotifier extends StateNotifier<AsyncValue<UserEntityModel?>> {
  final UserFirebaseRepository _userRepository;

  UpdateUserNotifier(this._userRepository) : super(const AsyncValue.loading());

  Future<void> fetchCurrentUser() async {
    state = const AsyncValue.loading();
    try {
      final user = await _userRepository.fetchCurrentUserEntity();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUser(String name) async {
    if (state.value == null) return;

    state = const AsyncValue.loading();
    try {
      final updatedUser = await _userRepository.updateUserName(
          state.value!.id.toString(), name);

      state = AsyncValue.data(updatedUser);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final updateUserNotifierProvider =
    StateNotifierProvider<UpdateUserNotifier, AsyncValue<UserEntityModel?>>(
        (ref) {
  final userRepository = ref.watch(userFirebaseRepositoryProvider);
  return UpdateUserNotifier(userRepository);
});
