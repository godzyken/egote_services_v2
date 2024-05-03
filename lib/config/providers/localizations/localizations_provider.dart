// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:intl/intl.dart';

class MultiLang extends StateNotifier<Locale> {
  MultiLang(this.localeName)
      : super(const Locale.fromSubtags(languageCode: 'fr'));

  final String localeName;

  String get title {
    return Intl.message(
      'messageText',
      name: 'title',
      desc: 'Title for this Shiiiit',
      locale: localeName,
    );
  }

  static MultiLang of(BuildContext context) {
    return Localizations.of<MultiLang>(context, MultiLang)!;
  }

  static initializeMessages(String localeName) async {
    return await createLocalMediaStream(localeName);
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
    'fr': {
      'title': 'Bonjour tout le Monde',
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  void en() => state = const Locale.fromSubtags(languageCode: 'en');

  void es() => state = const Locale.fromSubtags(languageCode: 'es');

  void fr() => state = const Locale.fromSubtags(languageCode: 'fr');
}

final localizationProvider = StateNotifierProvider<MultiLang, Locale>((ref) {
  final localeName = ref.read(localeProvider).languageCode;
  return MultiLang(localeName);
}, name: 'internationalisation provider');

final localeProvider =
    Provider<Locale>((_) => const Locale.fromSubtags(languageCode: 'und'));

class CustomLocalizationsDelegate extends LocalizationsDelegate<MultiLang> {
  @override
  bool isSupported(Locale locale) =>
      MultiLang.languages().contains(locale.languageCode);

  @override
  Future<MultiLang> load(Locale locale) {
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return SynchronousFuture<MultiLang>(MultiLang(localeName));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MultiLang> old) => false;
}
