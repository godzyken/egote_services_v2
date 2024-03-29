import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/presentation/extensions/extensions.dart';

class NameField extends ConsumerWidget {
  const NameField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.onEditingComplete,
    this.obscureText = false,
    this.inputType = TextInputType.name,
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
      key: const Key('name_formz'),
      label: context.tr!.userName,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      hintText: context.tr!.enterUsername,
      errorText: errorText,
      obscureText: obscureText,
      inputType: TextInputType.name,
      validator: validator,
    );
  }
}