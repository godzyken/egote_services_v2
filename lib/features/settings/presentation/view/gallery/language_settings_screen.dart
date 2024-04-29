import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettingsScreen extends ConsumerStatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  ConsumerState createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState
    extends ConsumerState<LanguageSettingsScreen> {
  final FlutterLocalNotificationsPlugin _localization =
      FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings? _androidInitializationSettings;
  DarwinInitializationSettings? _darwinInitializationSettings;
  LinuxInitializationSettings? _linuxInitializationSettings;

  @override
  void initState() {
    super.initState();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: _androidInitializationSettings,
            iOS: _darwinInitializationSettings,
            macOS: _darwinInitializationSettings,
            linux: _linuxInitializationSettings);

    _localization.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) =>
          _receiveNotificationResponse(details),
      onDidReceiveBackgroundNotificationResponse: (details) =>
          _receiveBackgroundNotificationResponse(details),
    );

    /*    _localization.init(
        mapLocales: [
          MapLocale('en', AppLocale.EN,
              countryCode: 'US', fontFamily: 'Font EN'),
          MapLocale('es', AppLocale.ES,
              countryCode: 'ES', fontFamily: 'Font ES'),
          MapLocale('fr', AppLocale.FR,
              countryCode: 'FR', fontFamily: 'Font FR'),
        ], initLanguageCode: 'fr');
    _localization.onTranslatedLanguage = _onTranslatedLanguage;*/
  }

  void _receiveNotificationResponse(NotificationResponse? response) {}

  void _receiveBackgroundNotificationResponse(NotificationResponse? response) {}

  /* void _onTranslatedLanguage(Locale? locale) {
    setState(() {
      _localization.translate(locale!.languageCode, save: true);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final lang = ref.read(localizationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('${context.tr?.languageSettingsScreen}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(
                      'English',
                      locale: lang,
                    ),
                    onPressed: () {
                      //_localization.periodicallyShow('en');
                      setState(() {
                        ref.read(localizationProvider.notifier).en();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Español'),
                    onPressed: () {
                      //_localization.translate('es');
                      setState(() {
                        ref.read(localizationProvider.notifier).es();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Français'),
                    onPressed: () {
                      //_localization.translate('fr', save: false);
                      setState(() {
                        ref.read(localizationProvider.notifier).fr();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            /*        ItemWidget(
              title: 'Current Language',
              content: //_localization.getLanguageName(),
            ),
            ItemWidget(
              title: 'Font Family',
              content: //_localization.fontFamily,
            ),
            ItemWidget(
              title: 'Locale Identifier',
              content: //_localization.currentLocale.localeIdentifier,
            ),
            ItemWidget(
              title: 'String Format',
              content: Strings.format(
                'Hello %a, this is me %a.',
                ['Dara', 'Sopheak'],
              ),
            ),
            ItemWidget(
              title: 'Context Format String',
              content: context.formatString(
                AppLocale.thisIs,
                [AppLocale.title, 'LATEST'],
              ),
            ),*/
            /*  const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  spellCheckConfiguration: SpellCheckConfiguration(),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

mixin AppLocale {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  static Map<String, dynamic> EN = {
    title: localizationProvider.notifier
        .select((value) => Future.value(value.title)),
    thisIs: localizationProvider.notifier
        .select((value) => Future.value(value.title))
  };
  static Map<String, dynamic> ES = {
    title: localizationProvider.notifier
        .select((value) => Future.value(value.title)),
    thisIs: localizationProvider.notifier
        .select((value) => Future.value(value.title))
  };
  static Map<String, dynamic> FR = {
    title: localizationProvider.notifier
        .select((value) => Future.value(value.title)),
    thisIs: localizationProvider.notifier
        .select((value) => Future.value(value.title))
  };
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(title ?? '')),
          const Text(' : '),
          Expanded(child: Text(content ?? '')),
        ],
      ),
    );
  }
}
