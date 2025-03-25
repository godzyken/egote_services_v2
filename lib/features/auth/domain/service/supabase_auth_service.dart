import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabaseClient;

  SupabaseAuthService(this.supabaseClient);

  // Connexion avec un fournisseur OAuth générique
  Future<void> signInWithOAuth(OAuthProvider provider,
      {required String redirectUrl}) async {
    try {
      // Effectuer l'authentification avec le fournisseur OAuth spécifié
      final isAuthenticated = await supabaseClient.auth.signInWithOAuth(
        provider,
        authScreenLaunchMode: LaunchMode.inAppWebView,
        redirectTo: redirectUrl,
      );

      // Vérifier si l'authentification a réussi
      if (!isAuthenticated) {
        throw Exception(
            'Erreur lors de l\'authentification avec ${provider.toString()}');
      }

      // Si l'authentification est réussie, vous pouvez récupérer l'utilisateur
      final user = supabaseClient.auth.currentUser;
      if (user != null) {
        developer.log('Utilisateur connecté: ${user.email}');
      }

      // Lier un fournisseur d'identité (par exemple Google, Apple, etc.)
      await linkAccount(provider);
    } catch (e) {
      // Gestion d'erreurs générales (celles qui viennent de Supabase ou du processus en général)
      developer.log('Erreur: $e');
    }
  }

  // Lier un compte au fournisseur OAuth générique
  Future<void> linkAccount(OAuthProvider provider) async {
    try {
      final isLinked = await supabaseClient.auth.linkIdentity(provider);

      // Vérifiez si la liaison a réussi
      if (!isLinked) {
        throw Exception(
            'Erreur lors de la liaison du compte avec ${provider.toString()}');
      }

      // Si l'utilisateur a été lié avec succès, vous pouvez obtenir le nouvel utilisateur
      final user = supabaseClient.auth.currentUser;
      if (user != null) {
        developer.debugger(
            when: kDebugMode,
            message: 'Compte lié avec succès à ${user.email}');
      }
    } catch (e) {
      // Gestion d'erreurs générales (celles qui viennent de Supabase ou du processus en général)
      developer.debugger(when: kDebugMode, message: 'Erreur: $e');
    }
  }
}
