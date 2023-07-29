import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/settings/presentation/widgets/theme_settings.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../../config/app_shared/insets/app_insets.dart';
import '../../../../../config/app_shared/universal/page_body.dart';
import '../../../../../config/providers/platform/platform_provider.dart';
import '../../../../theme/views/widgets/showcase_extensions.dart';
import '../../../controllers/settings.dart';
import '../../dialogs/reset_settings_dialogs.dart';
import '../../widgets/platform_popup_menu.dart';


class CrossPlatformSettingsScreen extends ConsumerStatefulWidget {
  const CrossPlatformSettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CrossPlatformSettingsScreenState();
}

class _CrossPlatformSettingsScreenState
    extends ConsumerState<CrossPlatformSettingsScreen> {
  late final ScrollController scrollController;

  bool useCustomTheme = false;

  final platformsMap = <DevicePlatform, String>{
    DevicePlatform.device: 'Default',
    DevicePlatform.android: 'Android',
    DevicePlatform.iOS: 'iOS',
    DevicePlatform.web: 'Web',
    DevicePlatform.fuchsia: 'Fuchsia',
    DevicePlatform.linux: 'Linux',
    DevicePlatform.macOS: 'MacOS',
    DevicePlatform.windows: 'Windows',
  };
  DevicePlatform selectedPlatform = DevicePlatform.device;


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: 'pageBodyScroll'
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle medium = textTheme.headlineMedium!;

    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top + kToolbarHeight + AppInsets.m;
    final double bottomPadding =
        media.padding.bottom + kBottomNavigationBarHeight;

    final bool isNarrow = media.size.width < AppInsets.phoneWidthBreakpoint;
    final double sideMargin = isNarrow ? 0 : AppInsets.l;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text('${context.tr?.egoteServicesTitle}'),
      ),
      drawer: const CustomMenuWidget(),
      // This annotated region will change the Android system navigation bar to
      // a theme color, matching active theme mode and FlexColorScheme theme.
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: FlexColorScheme.themedSystemNavigationBar(context),
        child: PageBody(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(
              sideMargin,
              topPadding,
              sideMargin,
              bottomPadding,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.l),
                child: Text('${context.tr?.info}', style: medium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.l),
                child: Text('${context.tr?.infoThemeSettings}'),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.l),
                child: Text('${context.tr?.persistence}', style: medium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.l),
                child: Text('${context.tr?.persistenceMemoryDescription}'),
              ),
              const KeyValueDbListTile(),
              ListTile(
                title: Text('${context.tr?.resetSettingsTitle}'),
                onTap: () async {
                  final bool? reset = await showDialog<bool?>(
                    context: context,
                    builder: (BuildContext context) {
                      return const ResetSettingsDialog();
                    },
                  );
                  if (reset ?? false) {
                    Settings.reset(ref);
                  }
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.l),
                child: Text('${context.tr?.themeSettings}', style: medium),
              ),
              const ThemeSettings(),
              const Divider(),
              PlatformPopupMenu(
                platform: ref.watch(platformProvider),
                onChanged: (TargetPlatform newPlatform) {
                  ref.read(platformProvider.notifier).state = newPlatform;
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.edge),
                child: Text('${context.tr?.themeColors}', style: medium),
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
            ],
          ),
        ),
      ),
    );
  }
}


