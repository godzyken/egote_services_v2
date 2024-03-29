import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextInputField extends ConsumerWidget {
  const TextInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
    required this.label,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.onEditingComplete,
    this.inputType = TextInputType.text,
    this.validator,
    this.decoration,
    this.onFieldSubmitted,
    this.maxLength,
  });

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final String hintText;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool obscureText;
  final TextInputType inputType;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 4),
          width: MediaQuery.of(context).size.width,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorText: errorText,
            hintText: hintText,
          ),
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          keyboardType: inputType,
          validator: validator,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          maxLength: maxLength,
        )
      ],
    );
  }
}