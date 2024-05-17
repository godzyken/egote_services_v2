import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitButton extends ConsumerWidget {
  final double height;
  final VoidCallback? onPressed;
  final bool enabled;
  final String text;
  final double fontSize;

  const SubmitButton(
    this.text, {
    super.key,
    this.height = 42,
    this.onPressed,
    this.enabled = true,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: height,
      decoration: BoxDecoration(
        color: enabled ? Colors.blue : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width - 40, height)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
