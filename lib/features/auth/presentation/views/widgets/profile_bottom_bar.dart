import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/userscreens/update_user_dialog_screen.dart';

Widget buildProfileBottomBar({
  required BuildContext context,
  required String userId,
  required User user,
}) {
  if (user.isAnonymous) return const SizedBox.shrink();

  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () => user.reload(), icon: const Icon(Icons.refresh)),
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
    ),
  );
}
