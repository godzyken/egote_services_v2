import 'package:badges/badges.dart' as badges;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

bool isDesktop() {
  return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}

void showModal({
  required BuildContext context,
  required Widget child,
  double maxWidth = 600,
}) {
  if (isDesktop()) {
    showDialog(
        context: context,
        builder: (BuildContext cxt) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: KeyboardListener(
              focusNode: FocusNode(onKeyEvent: (FocusNode node, KeyEvent evt) {
                if (evt.logicalKey == LogicalKeyboardKey.escape) {
                  if (evt is KeyDownEvent) {
                    context.pop(context);
                    return KeyEventResult.handled;
                  }
                }

                return KeyEventResult.ignored;
              }),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: child),
              ),
            ),
          );
        });
  } else if (Platform.isAndroid) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        builder: (context) {
          return child;
        });
  } else if (Platform.isIOS) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        builder: (context) {
          return child;
        });
  }
}

void updateBadgeCount(int? count) {
  /* FlutterAppBadger.isAppBadgeSupported().then((isBadgesSupported) {
    if (isBadgesSupported) {
      if (count == null || count == 0) {
        FlutterAppBadger.removeBadge();
      } else {
        FlutterAppBadger.updateBadgeCount(count);
      }
    }
  });*/

  badges.BadgeState().createTicker((elapsed) {
    if (elapsed.isNegative) {
      if (count == null || count == 0) {
        const badges.Badge(
          showBadge: false,
        );
      } else {
        badges.Badge(
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            badgeColor: Colors.blue,
            padding: const EdgeInsets.all(5),
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.white, width: 2),
            borderGradient: const badges.BadgeGradient.linear(
                colors: [Colors.red, Colors.black]),
            badgeGradient: const badges.BadgeGradient.linear(
              colors: [Colors.blue, Colors.yellow],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            elevation: 0,
          ),
          showBadge: true,
          badgeAnimation: const badges.BadgeAnimation.scale(
              appearanceDisappearanceFadeAnimationEnabled: true),
          child: Text('$count : Badge'),
        );
      }
    }
  });
}

bool get isPhoneAuthSupported => kIsWeb || !isDesktop();
