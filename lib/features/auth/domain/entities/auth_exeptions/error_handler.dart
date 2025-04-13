import 'dart:developer' as developer;

import 'package:fpdart/fpdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../../common/domain/failures/failure.dart';

class AuthErrorHandler {
  // Fonction générique pour la gestion des erreurs
  static Either<Failure, T> handleError<T>(Object e, {String? message}) {
    if (e is AuthException) {
      final errorCode = int.parse(e.code!);
      final errorDetail =
          'Erreur d\'authentification status code: ${e.statusCode}, message: ${e.message}';
      developer.log(error: errorCode, errorDetail);
      return left(Failure.unprocessableEntity(message: e.message));
    } else if (e is PostgrestException) {
      final errorCode = int.parse(e.code!);
      final errorDetail =
          'Erreur de base de données: ${e.message}, code: ${e.code}, details: ${e.details}';
      developer.log(error: errorCode, errorDetail);
      return left(Failure.unprocessableEntity(message: e.message));
    } else if (e is AuthApiException) {
      final errorCode = int.parse(e.code!);
      final errorDetail = 'Erreur serveur auth api: ${e.message}';
      developer.log(error: errorCode, errorDetail);
      return left(Failure.unprocessableEntity(message: e.message));
    } else if (e is SentryException) {
      final errorCode = int.parse(e.value!);
      final errorDetail = 'Erreur Sentry stack trace: ${e.stackTrace}';
      final errorMachanism = 'Erreur Sentry mechanism: ${e.mechanism}';
      developer.log(error: errorCode, errorDetail);
      developer.log(error: errorMachanism, '${e.mechanism}');
      return left(Failure.unprocessableEntity(message: e.throwable));
    } else {
      return left(Failure.unprocessableEntity(
          message: message ?? 'Unknown error occurred'));
    }
  }
}
