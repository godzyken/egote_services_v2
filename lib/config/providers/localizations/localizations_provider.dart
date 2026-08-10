// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  static List<String> languages() => ['en', 'es', 'fr'];

  // Méthodes pour changer la langue courante
  void setLocale(Locale locale) => state = locale;

  void en() => state = const Locale.fromSubtags(languageCode: 'en');

  void es() => state = const Locale.fromSubtags(languageCode: 'es');

  void fr() => state = const Locale.fromSubtags(languageCode: 'fr');
}

// 3. Provider unifié Riverpod 3 (Auto-disposed par défaut)
final localizationProvider =
NotifierProvider<MultiLangNotifier, Locale>(
  MultiLangNotifier.new,
  name: 'LocalizationProvider',
);
