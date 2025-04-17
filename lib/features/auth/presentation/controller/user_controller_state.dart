import 'dart:io';

import 'package:firebase_database/firebase_database.dart' as firebase_core;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase_auth_ui;

import '../../../../config/providers/supabase/supabase_providers.dart';
import '../../../../config/providers/watchdog/datadog_logger_helper.dart';
import '../../domain/entities/user/user_entity.dart';

class UserControllerState extends AsyncNotifier<UserEntityModel> {
  late final DatadogLoggerHelper _logger;
  late final supabase_auth_ui.SupabaseClient _supabase;

  late final firebase_core.DataSnapshot _snapshot;
  @override
  Future<UserEntityModel> build() async {
    // return nothing on first build
    throw UnimplementedError('Call load(userId) explicitly');
  }

  // Future<void> _loadInternal(String userId) async {
  //   _logger = ref.read(datadogLoggerHelperProvider);
  //   _supabase = ref.read(supabaseClientProvider);
  //
  //   state = const AsyncLoading();
  //
  //   state = await AsyncValue.guard(() async {
  //     _logger.info('🔄 Loading user profile...', extra: {'userId': userId});
  //
  //     return await _logger.trace<UserEntityModel>('load-user-profile',
  //         () async {
  //       return await _logger.trackApiCall<UserEntityModel>('load-user-profile',
  //           () async {
  //         final data =
  //             await _supabase.from('users').select().eq('id', userId).single();
  //
  //         if (data.isEmpty) throw Exception('No user found');
  //
  //         final user = UserEntityModel.fromMap(data);
  //         _logger.info('✅ User loaded',
  //             extra: {'userId': user.id, 'username': user.name});
  //
  //         return user;
  //       });
  //     });
  //   });
  // }

  Future<void> load(String userId) async {
    _logger = ref.read(datadogLoggerHelperProvider);
    _supabase = ref.read(supabaseClientProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      _logger.info('🔄 Loading user profile...', extra: {'userId': userId});

      return await _logger.trace<UserEntityModel>('load-user-profile',
          () async {
        return await _logger.trackApiCall<UserEntityModel>('load-user-profile',
            () async {
          final data = await _supabase
              .from('auth_users_table') // <-- correction ici
              .select()
              .eq('id', userId)
              .single();

          if (data.isEmpty) throw Exception('No user found');

          final user = UserEntityModel.fromMap(data);
          _logger.info('✅ User loaded', extra: {
            'userId': user.id,
            'username': user.name,
          });

          return user;
        });
      });
    });
  }

  Future<UserEntityModel> reloadUser(String userId) async {
    _logger = ref.read(datadogLoggerHelperProvider);
    _supabase = ref.read(supabaseClientProvider);

    _logger.info('🔄 Reloading user profile...', extra: {'userId': userId});

    final result =
        await _logger.trace<UserEntityModel>('reload-user-profile', () async {
      return _logger.trackApiCall<UserEntityModel>('reload-user-profile',
          () async {
        final data = await _supabase
            .from('auth_users_table')
            .select()
            .eq('id', userId)
            .single();

        if (data.isEmpty) throw Exception('No user found');

        final user = UserEntityModel.fromMap(data);
        _logger.info('✅ User reloaded',
            extra: {'userId': user.id, 'username': user.name});

        return user;
      });
    });

    state = AsyncData(result);
    return result;
  }

  Future<void> updateUserProfilePartial({
    required String userId,
    String? name,
    String? email,
    String? avatarUrl,
    String? phone,
    String? externalLink,
  }) async {
    _logger = ref.read(datadogLoggerHelperProvider);
    _supabase = ref.read(supabaseClientProvider);

    _logger.info('✏️ Updating profile...', extra: {
      'userId': userId,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'phone': phone,
      'externalLink': externalLink,
    });

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final partialUserUpdate = UserEntityModel.empty().toPartialJson(
        name: name,
        email: email,
        avatarUrl: avatarUrl,
        phone: phone,
        externalLink: externalLink,
      );
      await _supabase
          .from('auth_users_table')
          .update(partialUserUpdate)
          .eq('id', userId);

      final updatedUser = await reloadUser(userId);
      _logger.info('✅ Profile updated', extra: {
        'userId': userId,
        'name': updatedUser.name,
        'email': updatedUser.email,
        'avatarUrl': updatedUser.avatarUrl,
      });

      return updatedUser;
    });
  }

  Future<void> uploadAvatar(String userId, File avatar) async {
    _logger.info('🔄 Start uploading avatar...', extra: {'userId': userId});

    // 🔧 Étape 1 : compression & redimensionnement
    final compressedFile = await compressAndResizeImage(avatar);
    final fileBytes = await compressedFile.readAsBytes();
    final fileName = 'avatar/$userId.jpg';
    final storage = _supabase.storage.from('auth_users_table');

    return await _logger.trace('upload-avatar', () async {
      return await _logger.trackApiCall('upload-avatar', () async {
        try {
          final uploadResponse = await storage.updateBinary(fileName, fileBytes,
              fileOptions: const supabase_auth_ui.FileOptions(upsert: true));
          if (uploadResponse.isEmpty) {
            throw Exception('Error uploading avatar');
          }
          _logger.info('✅ Avatar uploaded', extra: {
            'userId': userId,
            'avatarUrl': uploadResponse,
          });

          await updateUserProfilePartial(
              userId: userId, avatarUrl: uploadResponse);
        } on supabase_auth_ui.PostgrestException catch (e, stack) {
          _logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        }
      });
    });
  }

  Future<void> deleteAvatar(String userId) async {
    _logger.info('🔄 Start deleting avatar...', extra: {'userId': userId});
    final storage = _supabase.storage.from('auth_users_table');
    return await _logger.trace('delete-avatar', () async {
      return await _logger.trackApiCall('delete-avatar', () async {
        try {
          final paths = storage.list(path: 'avatar').toString();
          if (paths.isEmpty) {
            throw Exception('No avatar found');
          }
          final res = await storage.remove(paths.split('folder/image.jpg'));
          if (res.isEmpty) {
            throw Exception('Error deleting avatar');
          }
          _logger.info('✅ Avatar deleted', extra: {'userId': userId});
        } on supabase_auth_ui.PostgrestException catch (e, stack) {
          _logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        } catch (e, stack) {
          _logger.error(
              '🚨 Error deleting avatar', extra: {'userId': userId}, e, stack);
        }
        await updateUserProfilePartial(userId: userId, avatarUrl: '');
      });
    });
  }

  Future<File> compressAndResizeImage(File originalFile,
      {int maxWith = 600, int quality = 80}) async {
    final bytes = await originalFile.readAsBytes();

    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Image is null');

    final resizedImage = img.copyResize(image, width: 200, height: 200);

    final jpg = img.encodeJpg(resizedImage, quality: quality);

    final compressedFile = File('${originalFile.path}_compressed.jpg');
    await compressedFile.writeAsBytes(jpg);

    return compressedFile;
  }

  Future<void> updateUser(UserEntityModel user) async {
    await _snapshot.child('users').ref.update(user.toPartialJson(
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
          phone: user.phone,
          externalLink: user.externalLink,
        ));
    _logger.info('✅ User updated', extra: {
      'userId': user.id,
      'username': user.name,
    });

    state = await AsyncValue.guard(() async {
      AsyncValue.data(UserModel.complete(id: user.id, userEntityModel: user));
      return user;
    });
  }
}

final userControllerStateProvider =
    AsyncNotifierProvider<UserControllerState, UserEntityModel>(
        () => UserControllerState());
