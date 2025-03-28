import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/providers/auth_providers.dart';

class UpdateUserDialogScreen extends ConsumerStatefulWidget {
  const UpdateUserDialogScreen({super.key});

  @override
  ConsumerState<UpdateUserDialogScreen> createState() =>
      _UpdateUserDialogScreenState();
}

class _UpdateUserDialogScreenState
    extends ConsumerState<UpdateUserDialogScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final authController = ref.read(loginControllerNotifierProvider);
    _emailController =
        TextEditingController(text: authController.emailFormz?.value ?? '');
    _passwordController =
        TextEditingController(text: authController.passwordFormz?.value ?? '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final authController = ref.read(loginControllerNotifierProvider);
    return authController.emailFormz?.validator(value!).toString();
  }

  String? _validatePassword(String? value) {
    final authController = ref.read(loginControllerNotifierProvider);
    return authController.passwordFormz?.validator(value!).toString();
  }

  void _updateProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      final authController = ref.read(loginControllerNotifierProvider);

      authController.emailFormz?.validator(_emailController.text);
      authController.passwordFormz?.validator(_passwordController.text);

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(loginControllerNotifierProvider);
    return AlertDialog.adaptive(
      title: Text(context.tr!.updateProfile),
      content: SingleChildScrollView(
          child: Form(
        onChanged: () => authController.status,
        key: _formKey,
        child: ListBody(
          children: <Widget>[
            _buildTextFormField(
              controller: _emailController,
              label: context.tr!.email,
              validator: _validateEmail,
            ),
            _buildTextFormField(
              controller: _passwordController,
              label: context.tr!.password,
              validator: _validatePassword,
            )
          ],
        ),
      )),
      actions: [
        TextButton(
          onPressed: _updateProfile,
          child: Text(context.tr!.update),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      validator: validator,
    );
  }
}
