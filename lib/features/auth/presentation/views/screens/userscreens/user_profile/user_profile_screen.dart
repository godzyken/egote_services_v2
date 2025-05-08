import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/controller/user_controller.dart';
import '../../../../controller/user_controller_state.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(firebaseUserProvider);
    final userEntityAsync = ref.watch(userControllerStateProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final selectedAvatar = ref.watch(selectedAvatarProvider);
    final firebaseUser = ref
        .watch(firebaseUserProvider)
        .maybeWhen(data: (user) => user, orElse: () => null);
    if (firebaseUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed('auth');
      });
      return const SizedBox.shrink();
    }
    final isOwnProfile = firebaseUser.uid == widget.userId;

    return asyncUser.when(
      error: (error, stackTrace) => Center(
        child: Text(
          context.tr!.showcaseErrorText + error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (currentUser) {
        if (currentUser == null) {
          return const Center(child: Text("User not found"));
        }

        return userEntityAsync.when(
          data: (userEntity) {
            return Scaffold(
              appBar: buildProfileAppBar(
                  context: context,
                  ref: ref,
                  name: userEntity.name,
                  userId: widget.userId,
                  isOwnProfile: isOwnProfile,
                  onEdit: () => showAvatarBottomSheet(context, widget.userId),
                  onReload: () => ref
                      .read(userControllerStateProvider.notifier)
                      .reloadUser(widget.userId)),
              body: buildProfileBody(
                context: context,
                user: currentUser,
                avatarUrl: userEntity.avatarUrl,
                email: userEntity.email,
                isOwnProfile: isOwnProfile,
                isLoading: isLoading,
                onSave: () => _editProfile(widget.userId),
              ),
              bottomNavigationBar: isOwnProfile
                  ? buildProfileBottomBar(
                      context: context,
                      userId: widget.userId,
                      user: currentUser)
                  : null,
            );
          },
          error: (err, stack) => Scaffold(
            body: Center(
              child: Text(err.toString()),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _editProfile(String userId) async {
    final selectedAvatar = ref.read(selectedAvatarProvider);
    ref.read(isLoadingProvider.notifier).state = true;

    try {
      final controller = ref.read(userControllerProvider);
      if (selectedAvatar != null) {
        await controller.uploadUserAvatar(
            userId: userId, avatar: selectedAvatar);
        ref.read(selectedAvatarProvider.notifier).state = null;
      }

      await ref.read(userControllerStateProvider.notifier).reloadUser(userId);
      ref.invalidate(userControllerStateProvider);
    } catch (e, st) {
      developer.log('Erreur de mise à jour : $e', stackTrace: st);

      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Erreur de mise à jour'),
            content: Text(
                'Une erreur est survenue lors de la mise à jour: ${e.toString()}'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }
}
