import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_shared/images/list_local.dart';

class CustomMenuWidget extends ConsumerStatefulWidget {
  const CustomMenuWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomMenuWidget> createState() => _CustomMenuWidgetState();
}

class _CustomMenuWidgetState extends ConsumerState<CustomMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                LocalImages.earthAugmentedImage,
              ),
            ),
            ListTile(
              onTap: () => context.go('/user_home/:pid'),
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              onTap: () => context.go('/person/:uid'),
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.favorite),
              title: const Text('Favourites'),
            ),
            ListTile(
              onTap: () => context.go('/settingsRoute'),
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
