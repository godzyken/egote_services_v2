import 'package:egote_services_v2/config/app_shared/extensions/app_scroll_behavior.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_shared/images/list_local.dart';

class CustomMenuWidget extends ConsumerWidget {
  const CustomMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final double drawerWidth = theme.drawerTheme.width ?? (theme.useMaterial3 ? 360 : 304);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: GestureDetector(
          onTap: () {
            context.pop(context);
          },
          child: ScrollConfiguration(
              behavior: ScrollNoEdgeEffect(),
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                            colors: [
                              theme.colorScheme.primary,
                              theme.primaryColorLight,
                            ],
                          ),
                          image: const DecorationImage(image: AssetImage(LocalImages.earthAugmentedImage))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Screen width: ${screenWidth.toStringAsFixed(0)}',
                              style: theme.primaryTextTheme.labelSmall,
                            ),
                            Text(
                              'Drawer theme: ${drawerWidth.toStringAsFixed(0)}',
                              style: theme.primaryTextTheme.labelSmall,
                            ),
                          ],
                        )
                    ),
                    const UseMaterial3Switch(),
                    const Divider(),
                    const UseSubThemesListTile(
                      title: Text('Component themes'),
                    ),
                    const Divider(),
                    const ThemeModeListTile(title: Text('Theme')),
                    const Divider(),
                    ListTile(
                      onTap: () => context.go('/user_home/:pid'),
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () => context.go('/person/:uid'),
                      leading: const Icon(Icons.account_circle_rounded),
                      title: const Text('Profile'),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favourites'),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () => context.go('/settingsRoute'),
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                    const Divider(),
                    const Spacer(),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 30.0,
                        ),
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ]
              )
          )
      ),
    );
  }

  ListTileTheme buildCustomListTileTheme(BuildContext context) {
    return ListTileTheme(
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

          const Divider(),
          ListTile(
            onTap: () => context.go('/user_home/:pid'),
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          const Divider(),
          ListTile(
            onTap: () => context.go('/person/:uid'),
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Profile'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.favorite),
            title: const Text('Favourites'),
          ),
          const Divider(),
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
    );
  }
}

