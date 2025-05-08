import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget buildProfileBody({
  required BuildContext context,
  required User user,
  required String avatarUrl,
  required String email,
  required bool isOwnProfile,
  required bool isLoading,
  required VoidCallback onSave,
}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        if (avatarUrl.isNotEmpty)
          CircleAvatar(radius: 50, backgroundImage: NetworkImage(avatarUrl)),
        const SizedBox(height: 16),
        Text(email, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (isOwnProfile)
          ElevatedButton.icon(
            icon: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Icon(Icons.save),
            label: isLoading
                ? const Text("Enregistrement en cours")
                : const Text("Mettre à jour le profil"),
            onPressed: isLoading ? null : onSave,
          ),
        if (isLoading) const CircularProgressIndicator(),
      ],
    ),
  );
}
