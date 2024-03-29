import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/providers/auth_providers.dart';

class UpdateUserDialogScreen extends ConsumerStatefulWidget {
  const UpdateUserDialogScreen({super.key});

  @override
  ConsumerState<UpdateUserDialogScreen> createState() => _UpdateUserDialogScreenState();
}

class _UpdateUserDialogScreenState extends ConsumerState<UpdateUserDialogScreen> {

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(loginControllerNotifierProvider);
    return AlertDialog.adaptive(
      title: Text(context.tr!.updateProfile),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: TextEditingController(text: authController.passwordFormz!.value),
              autocorrect: false,
              decoration: InputDecoration(labelText: context.tr!.password),
            ),
            TextFormField(
              controller: TextEditingController(text: authController.emailFormz!.value),
              decoration: InputDecoration(labelText: context.tr!.email),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              validator: (String? value) {
                if (value!.isNotEmpty) {
                  var uri = Uri.parse(value);
                  if (uri.isAbsolute) {
                    //TODO: get the data with dart:io or http and check it here
                    return null;
                  }
                  return context.tr!.faultyUrl;
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
          child: Text(context.tr!.update),
        ),
      ],
    );
  }
}
