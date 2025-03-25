import 'dart:developer' as developer;
import 'dart:math';

import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/auth_exeptions/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entities/feedback/feedback.dart';

final feedbacksProvider =
    StateNotifierProvider<FeedbacksNotifier, List<AvisUtilisateur>>((ref) {
  return FeedbacksNotifier(ref);
});

class FeedbacksNotifier extends StateNotifier<List<AvisUtilisateur>> {
  FeedbacksNotifier(this.ref) : super([]) {
    _startListening();
  }

  final Ref ref;
  void logError(Object e) => AuthErrorHandler.handleError(e);

  void _startListening() async {
    ref.read(supabaseClientProvider).getChannels();

    // Exemple d'écoute d'un stream
    ref.keepAlive();

    loadFeedbacks();
  }

  Future<void> loadFeedbacks() async {
    try {
      // Appel à Supabase pour récupérer les données
      final response = await fetchList();
      state = response.isEmpty
          ? []
          : response.map((item) => AvisUtilisateur.fromJson(item)).toList();
    } on PostgrestException catch (e) {
      // Gestion des erreurs
      developer.log('Erreur lors du chargement des feedbacks:');
      logError(e);

      state = [];
    }
  }

  // Méthode pour récupérer la liste des feedbacks depuis Supabase
  Future<List<Map<String, dynamic>>> fetchList() async {
    // Appel à Supabase pour récupérer les données de la table 'avis_posts'
    final response =
        await ref.watch(supabaseClientProvider).from('avis_posts').select();

    // Transformez chaque élément de la réponse en un objet AvisUtilisateur
    return response.isEmpty ? [] : List<Map<String, dynamic>>.from(response);
  }

  // Cette fonction permet d'ajouter un feedback
  Future<void> addFeedback(String content, User user) async {
    try {
      // Vérification si l'utilisateur est anonyme ou non
      final userName = user.isAnonymous == true
          ? 'Batman'
          : user.appMetadata['display_name'] ?? 'Inconnu';
      final photoUrl =
          user.isAnonymous == true ? null : user.appMetadata['photo_url'];

      final newFeedback = AvisUtilisateur(
        id: Random().nextInt(1000000000),
        name: userName,
        message: content,
        photoUrl: photoUrl,
        createdAt: DateTime.now(),
        isAnonymous: user.isAnonymous,
      );

      // Appel à la méthode pour ajouter le feedback dans la base de données
      await _insertFeedback(newFeedback);
      // Mise à jour de l'état après ajout réussi
      state = [...state, newFeedback];
    } on PostgrestException catch (e) {
      // Gestion des erreurs
      developer.log('Erreur lors de l\'ajout du feedback:');
      logError(e);
      state = [];
    }
  }

  // Méthode d'insertion dans la base de données Supabase
  Future<PostgrestResponse> _insertFeedback(AvisUtilisateur feedback) async {
    return await ref
        .read(supabaseClientProvider)
        .from('avis_posts')
        .insert(feedback.toJson());
  }

  @override
  void dispose() {
    // Annuler l'écouteur lors de la fermeture de la ressource
    ref.read(supabaseClientProvider).dispose();
    super.dispose();
  }
}
