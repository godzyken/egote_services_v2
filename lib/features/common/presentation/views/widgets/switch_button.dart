import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _kTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.black54,
);

class SwitchButton extends ConsumerWidget {
  const SwitchButton({super.key, required this.showSignIn, required this.onTap});

  final bool showSignIn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 30,
        child: TextButton(
          onPressed: onTap,
          child: showSignIn
              ? Text(
            context.tr!.switchHavent,
            style: _kTextStyle,
          )
              : Text(
            context.tr!.switchHave,
            style: _kTextStyle,
          ),
        ));
  }
}
