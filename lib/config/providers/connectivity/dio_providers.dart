import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  // Configurer la base URL pour les requêtes
  dio.options.baseUrl = 'https://ltcnlgqoeunywzlewydv.supabase.co';

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Configurer les délais d'attente (timeouts)
  dio.options.connectTimeout = Duration(seconds: 5); // 5 secondes
  dio.options.receiveTimeout = Duration(seconds: 3); // 3 secondes

  // Ajouter un intercepteur personnalisé pour gérer l'authentification (si nécessaire)
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Par exemple, ajouter un token d'authentification dans les en-têtes
      final token =
          'sbp_1ab3d516d00ca0f129246c64d116d3fc5791bc35'; // Récupérer le token d'authentification si disponible
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      // Vous pouvez ajouter un traitement personnalisé des réponses ici
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      // Gérer les erreurs de manière personnalisée
      if (e.response?.statusCode == 401) {
        // Par exemple, rediriger vers la page de connexion si le token a expiré
      }
      return handler.next(e);
    },
  ));

  return dio;
}
