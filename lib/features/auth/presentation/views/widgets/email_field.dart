import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/presentation/extensions/extensions.dart';

class EmailField extends ConsumerWidget {
  const EmailField({
    Key? key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.onEditingComplete,
    this.obscureText = false,
    this.inputType = TextInputType.emailAddress,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String? label;
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
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      hintText: hintText!,
      suffixIcon: suffixIcon,
      errorText: errorText,
      obscureText: obscureText,
      label: label!,
      inputType: TextInputType.emailAddress,
      validator: validator,
    );
  }
}
