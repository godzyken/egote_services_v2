import 'dart:developer' as developer;
import 'dart:io';

import 'package:egote_services_v2/features/auth/presentation/views/screens/userscreens/update_user_dialog_screen.dart';
import 'package:egote_services_v2/features/auth/presentation/views/widgets/avatar_circle.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/controller/user_controller.dart';
import '../../../controller/user_controller_state.dart';
import '../../widgets/avatar_uploader.dart';

class UserProfileScreen extends ConsumerWidget {
  final String userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(firebaseUserProvider);
    final userEntityAsync = ref.watch(userControllerStateProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final selectedAvatar = ref.watch(selectedAvatarProvider);

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

        final isOwnProfile = currentUser.uid == userId;
        final isReadOnly = !isOwnProfile;

        return userEntityAsync.when(
          data: (userEntity) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profil de ${userEntity.name}'),
                actions: isReadOnly
                    ? null
                    : [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: AvatarCircleConsumer(radius: 26),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showAvatarBottomSheet(context, ref),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () => ref
                              .read(userControllerStateProvider.notifier)
                              .reloadUser(userId),
                        ),
                      ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (!isReadOnly) _buildAvatar(currentUser),
                    if (userEntity.avatarUrl.isNotEmpty)
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(userEntity.avatarUrl),
                      ),
                    const SizedBox(height: 16),
                    Text(userEntity.email,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (!isReadOnly)
                      ElevatedButton.icon(
                        icon: const Icon(Icons.save),
                        label: const Text("Mettre à jour le profil"),
                        onPressed: isLoading
                            ? null
                            : () => _editProfile(ref, currentUser.uid),
                      ),
                    if (isLoading) const CircularProgressIndicator(),
                  ],
                ),
              ),
              bottomNavigationBar: (!isReadOnly && !currentUser.isAnonymous)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildBottomActions(context, ref, currentUser),
                    )
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

  Future<void> _editProfile(WidgetRef ref, String userId) async {
    final selectedAvatar = ref.read(selectedAvatarProvider);
    ref.read(isLoadingProvider.notifier).state = true;

    try {
      final controller = ref.read(userControllerProvider);

      if (selectedAvatar != null) {
        await controller.uploadUserAvatar(
            userId: userId, avatar: selectedAvatar);
        ref.read(selectedAvatarProvider.notifier).state = null;
      }

      // Recharge le profil utilisateur
      await ref.read(userControllerStateProvider.notifier).reloadUser(userId);
      ref.invalidate(userControllerStateProvider);
    } catch (e) {
      developer.log('Erreur de mise à jour du profil : $e');
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.center,
      child: Text(
        context.tr!.userInfo,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAvatar(User user) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 8),
      child: Image.network(user.photoURL!),
    );
  }

  Widget _buildUserInfo(BuildContext context, User user, String? name,
      String id, dynamic created, dynamic lastLogin) {
    return Text(
      '${user.isAnonymous ? '${context.tr!.userAnonymous}\n\n' : ''}'
      '${context.tr!.email}: ${user.email} (${context.tr!.verified}: ${user.emailVerified})\n\n'
      '${context.tr!.phoneNumber}: ${user.phoneNumber}\n\n'
      '${context.tr!.name}: $name\n\n\n'
      'ID: $id\n\n'
      '${context.tr!.tenantId}: ${user.tenantId}\n\n'
      '${context.tr!.refresh} ${context.tr!.token}: ${user.refreshToken}\n\n\n'
      '${context.tr!.created}: $created\n\n'
      '${context.tr!.lastLogin}: $lastLogin\n\n',
    );
  }

  Widget _buildProviderList(
      BuildContext context, User user, File? selectedAvatar, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: user.providerData.map((provider) {
        return Dismissible(
          key: Key(provider.uid ?? provider.providerId),
          onDismissed: (_) => user.unlink(provider.providerId),
          child: Card(
            color: Colors.grey[300],
            child: ListTile(
              leading: provider.photoURL == null
                  ? IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => user.unlink(provider.providerId),
                    )
                  : selectedAvatar != null
                      ? Image.file(selectedAvatar, height: 120)
                      : Image.network(provider.photoURL!),
              title: Text(provider.providerId),
              subtitle: Text(
                "${provider.uid == null ? "" : "ID: ${provider.uid}\n"}"
                "${provider.email == null ? "" : "${context.tr!.email}: ${provider.email}\n"}"
                "${provider.phoneNumber == null ? "" : "${context.tr!.phoneNumber}: ${provider.phoneNumber}\n"}"
                "${provider.displayName == null ? "" : "${context.tr!.name}: ${provider.displayName}\n"}",
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomActions(BuildContext context, WidgetRef ref, User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => user.reload(),
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: () => showAdaptiveDialog(
            context: context,
            builder: (context) => UpdateUserDialogScreen(userId: userId),
          ),
          icon: const Icon(Icons.text_snippet),
        ),
        IconButton(
          onPressed: () => user.delete(),
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }

  void _showAvatarBottomSheet(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: AvatarUploaderDialog(userId: userId),
        ),
      ),
    );
  }
}
