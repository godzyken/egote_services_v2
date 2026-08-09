import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/providers/localizations/localizations_provider.dart';
import '../../../l10n/app_localizations.dart';

/// Provider permettant d'accéder à l'objet AppLocalizations pour la locale actuelle.
/// Il écoute réactivement localizationProvider.
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  final locale = ref.watch(localizationProvider);
  return lookupAppLocalizations(locale);
});
