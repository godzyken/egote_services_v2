import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/presentation/extensions/extensions.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.onEditingComplete,
    this.obscureText = true,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final bool obscureText;

  final TextInputType inputType;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextInputField(
      key: const Key('email_formz'),
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      hintText: context.tr!.enterUserPassword,
      suffixIcon: suffixIcon,
      errorText: errorText,
      obscureText: obscureText,
      label: context.tr!.password,
      inputType: TextInputType.visiblePassword,
      validator: validator,
    );
  }
}
