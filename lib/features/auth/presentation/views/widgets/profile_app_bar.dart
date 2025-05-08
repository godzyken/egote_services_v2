import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/providers/auth_repository_provider.dart';
import 'avatar_circle.dart';

AppBar buildProfileAppBar({
  required BuildContext context,
  required WidgetRef ref,
  required String name,
  required String userId,
  required bool isOwnProfile,
  required VoidCallback onEdit,
  required VoidCallback onReload,
}) {
  return AppBar(
    title: Text('Profil de $name'),
    actions: isOwnProfile
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: AvatarCircleConsumer(radius: 26),
            ),
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  await ref.read(authProvider.notifier).signOut();
                  if (!context.mounted) return;
                  context.goNamed('Auth');
                }),
            IconButton(icon: const Icon(Icons.refresh), onPressed: onReload),
          ]
        : null,
  );
}
