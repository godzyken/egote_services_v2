import 'package:flutter_test/flutter_test.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';

void main() {
  group('Failure Domain', () {
    test('should return correct message for empty failure', () {
      const failure = Failure.empty();
      expect(failure.message, 'Une erreur inconnue est survenue.');
    });

    test('should return correct message for unprocessableEntity failure', () {
      const message = 'Custom error message';
      const failure = Failure.unprocessableEntity(message: message);
      expect(failure.message, message);
    });

    test('should return correct message for unauthorized failure', () {
      const failure = Failure.unauthorized();
      expect(failure.message, 'Non autorisé. Veuillez vous reconnecter.');
    });

    test('should return correct message for badRequest failure', () {
      const failure = Failure.badRequest();
      expect(failure.message, 'Requête invalide.');
    });

    test('should return correct message for notFound failure', () {
      const failure = Failure.notFound();
      expect(failure.message, 'Ressource introuvable.');
    });

    test('should return correct message for serverError failure', () {
      const failure = Failure.serverError();
      expect(failure.message, 'Erreur serveur. Veuillez réessayer plus tard.');
    });

    test('should return correct message for networkError failure', () {
      const failure = Failure.networkError();
      expect(failure.message, 'Problème de connexion réseau.');
    });

    test('should return correct message for cacheError failure', () {
      const failure = Failure.cacheError();
      expect(failure.message, 'Erreur de base de données locale.');
    });

    test('should return correct message for tooManyRequests failure', () {
      const failure = Failure.tooManyRequests();
      expect(failure.message, 'Trop de tentatives. Veuillez patienter.');
    });

    test('should return correct message for permissionDenied failure', () {
      const failure = Failure.permissionDenied();
      expect(failure.message, 'Accès refusé.');
    });

    test('should return correct message for invalidCredentials failure', () {
      const failure = Failure.invalidCredentials();
      expect(failure.message, 'Identifiants invalides.');
    });
  });
}
