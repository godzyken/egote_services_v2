// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// 1. Provider fournissant la Locale de base
final localeProvider = Provider<Locale>(
      (_) => const Locale.fromSubtags(languageCode: 'fr'),
  name: 'LocaleProvider',
);

// 2. Notifier Riverpod 3
class MultiLangNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    // Initialise avec la valeur du provider de base
    return ref.watch(localeProvider);
  }

  String get localeName => state.languageCode;

  String get title {
    return Intl.message(
      'messageText',
      name: 'title',
      desc: 'Title for this application',
      locale: localeName,
    );
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

  // Méthodes pour changer la langue courante
  void setLocale(Locale locale) => state = locale;

  void en() => state = const Locale.fromSubtags(languageCode: 'en');

  void es() => state = const Locale.fromSubtags(languageCode: 'es');

  void fr() => state = const Locale.fromSubtags(languageCode: 'fr');
}

// 3. Provider unifié Riverpod 3 (Auto-disposed par défaut)
final localizationNotifierProvider =
NotifierProvider<MultiLangNotifier, Locale>(
  MultiLangNotifier.new,
  name: 'LocalizationNotifierProvider',
);

// 4. Classe déléguée Flutter Localizations
class CustomLocalizationsDelegate
    extends LocalizationsDelegate<MultiLangNotifier> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      MultiLangNotifier.languages().contains(locale.languageCode);

  @override
  Future<MultiLangNotifier> load(Locale locale) {
    final String name =
    locale.countryCode == null || locale.countryCode!.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    final notifier = MultiLangNotifier();
    // Configure la locale initiale chargée par le widget MaterialApp
    notifier.setLocale(Locale(localeName));

    return SynchronousFuture<MultiLangNotifier>(notifier);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MultiLangNotifier> old) =>
      false;
}