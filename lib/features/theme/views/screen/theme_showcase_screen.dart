import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/app_shared/insets/app_insets.dart';
import '../../../../config/app_shared/universal/page_body.dart';
import '../widgets/showcase_extensions.dart';

class ThemeShowcasePage extends StatefulWidget {
  const ThemeShowcasePage({super.key});

  @override
  State<ThemeShowcasePage> createState() => _ThemeShowcasePageState();
}

class _ThemeShowcasePageState extends State<ThemeShowcasePage> {
  int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle medium = textTheme.headlineMedium!;

    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top + kToolbarHeight * 2;
    final double bottomPadding =
        media.padding.bottom + kBottomNavigationBarHeight + AppInsets.l;

    final bool isNarrow = media.size.width < AppInsets.phoneWidthBreakpoint;
    final double sideMargin = isNarrow ? 0 : AppInsets.l;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: Text(context.tr!.themeShowcase),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: context.tr!.home),
              Tab(text: context.tr!.favourites),
              Tab(text: context.tr!.profile),
              Tab(text: context.tr!.settings),
            ],
          ),
        ),
        drawer: const CustomMenuWidget(),
        // This annotated region will change the Android system navigation bar
        // to a theme color matching active FlexColorScheme theme.
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: FlexColorScheme.themedSystemNavigationBar(context),
          child: PageBody(
            child: ListView(
              primary: true,
              padding: EdgeInsets.fromLTRB(
                sideMargin,
                topPadding,
                sideMargin,
                bottomPadding,
              ),
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: Text(context.tr!.themeShowcase, style: medium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: Text(context.tr!.themeShowcaseText),
                ),
                const Divider(),
                // Show all key active theme colors.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(context.tr!.colors, style: medium),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: ShowColorSchemeColors(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: ShowThemeDataColors(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: ShowSubThemeColors(),
                ),
                const Divider(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: Text(context.tr!.showcase, style: medium),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.edge),
                  child: ShowcaseMaterial(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int value) {
            setState(() {
              _buttonIndex = value;
            });
          },
          selectedIndex: _buttonIndex,
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: const Icon(Icons.chat_bubble),
              label: context.tr!.labelChat,
              tooltip: '',
            ),
            NavigationDestination(
              icon: const Icon(Icons.beenhere),
              label: context.tr!.labelTasks,
              tooltip: '',
            ),
            NavigationDestination(
              icon: const Icon(Icons.create_new_folder),
              label: context.tr!.labelArchive,
              tooltip: '',
            ),
          ],
        ),
      ),
    );
  }
}