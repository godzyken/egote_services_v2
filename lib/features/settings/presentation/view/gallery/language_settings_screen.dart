import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettingsScreen extends ConsumerStatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  ConsumerState createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState
    extends ConsumerState<LanguageSettingsScreen> {
  final FlutterLocalization localization = FlutterLocalization.instance;


 /* @override
  void initState() {
    localization.init(
        mapLocales: [
          const MapLocale('en', AppLocale.)
        ],
        initLanguageCode: initLanguageCode
    );

    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }
*/
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {
      localization.translate(locale!.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final loc = ref.read(appLocalizationsProvider);

    return Scaffold(
      body: Container(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
              spellCheckConfiguration: SpellCheckConfiguration(),
            ),
          ),
        ),
      ),
    );
  }
}

mixin AppLocale {
}
