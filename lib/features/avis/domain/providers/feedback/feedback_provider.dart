import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/auth_exeptions/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

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
      final userName = user.isAnonymous
          ? 'Batman'
          : user.appMetadata['display_name'] ?? 'Inconnu';
      final photoUrl = user.isAnonymous ? null : user.appMetadata['photo_url'];

      // Generate a UUID instead of using random number
      final uuid = Uuid();
      final feedbackId = int.parse(uuid.v4()); // Unique ID generation

      final newFeedback = AvisUtilisateur(
        id: feedbackId, // Using the UUID here
        name: userName,
        photoUrl: photoUrl,
        message: content,
        createdAt: DateTime.now(),
        isAnonymous: user.isAnonymous,
      );

      // Debugging message before inserting the feedback
      developer.debugger(
          message: '[await _insertFeedback($newFeedback)]:', when: true);

      // Call the method to insert the feedback into the database
      await _insertFeedback(newFeedback);

      developer.debugger(
          message: '${[await _insertFeedback(newFeedback)]}:', when: false);

      // Updating the state after successfully adding the feedback
      state = [...state, newFeedback];
    } on PostgrestException catch (e) {
      // Handling errors, you might want to log the specific exception message
      developer.log('Error while adding feedback: ${e.message}');
      state = [];
    }
  }

  // Méthode d'insertion dans la base de données Supabase
  Future<PostgrestResponse> _insertFeedback(AvisUtilisateur feedback) async {
    try {
      return await ref
          .read(supabaseClientProvider)
          .from('avis_posts')
          .insert(feedback.toJson());
    } on PostgrestException catch (e) {
      // Gestion des erreurs
      developer.log('Erreur lors de l\'insertion du feedback:');
      logError(e);
      rethrow;
    }
  }

  @override
  void dispose() {
    // Annuler l'écouteur lors de la fermeture de la ressource
    ref.read(supabaseClientProvider).dispose();
    super.dispose();
  }
}
