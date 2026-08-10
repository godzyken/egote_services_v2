import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  const Failure._();
  
  const factory Failure.empty() = _EmptyFailure;

  const factory Failure.unprocessableEntity({required String message}) =
      _UnprocessableEntityFailure;

  const factory Failure.unauthorized() = _UnauthorizedFailure;

  const factory Failure.badRequest() = _BadRequestFailure;

  const factory Failure.notFound() = _NotFoundFailure;
  
  const factory Failure.serverError() = _ServerErrorFailure;
  
  const factory Failure.networkError() = _NetworkErrorFailure;
  
  const factory Failure.cacheError() = _CacheErrorFailure;
  
  const factory Failure.tooManyRequests() = _TooManyRequestsFailure;
  
  const factory Failure.permissionDenied() = _PermissionDeniedFailure;
  
  const factory Failure.invalidCredentials() = _InvalidCredentialsFailure;

  String get error => when(
    empty: () => 'Une erreur inconnue est survenue.',
    unprocessableEntity: (msg) => msg,
    unauthorized: () => 'Non autorisé. Veuillez vous reconnecter.',
    badRequest: () => 'Requête invalide.',
    notFound: () => 'Ressource introuvable.',
    serverError: () => 'Erreur serveur. Veuillez réessayer plus tard.',
    networkError: () => 'Problème de connexion réseau.',
    cacheError: () => 'Erreur de base de données locale.',
    tooManyRequests: () => 'Trop de tentatives. Veuillez patienter.',
    permissionDenied: () => 'Accès refusé.',
    invalidCredentials: () => 'Identifiants invalides.',
  );

  String get message => error;
}
