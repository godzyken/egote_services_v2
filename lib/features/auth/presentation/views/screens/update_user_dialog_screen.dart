import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers/auth_providers.dart';

class UpdateUserDialogScreen extends ConsumerStatefulWidget {
  const UpdateUserDialogScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateUserDialogScreen> createState() => _UpdateUserDialogScreenState();
}

class _UpdateUserDialogScreenState extends ConsumerState<UpdateUserDialogScreen> {

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(loginControllerNotifierProvider);
    return AlertDialog(
      title: const Text('Update profile'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: TextEditingController(text: authController.passwordFormz!.value),
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextFormField(
              controller: TextEditingController(text: authController.emailFormz!.value),
              decoration: const InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              validator: (String? value) {
                if (value!.isNotEmpty) {
                  var uri = Uri.parse(value);
                  if (uri.isAbsolute) {
                    //TODO: get the data with dart:io or http and check it here
                    return null;
                  }
                  return 'Faulty URL!';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            authController.passwordFormz;
            authController.status;
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
