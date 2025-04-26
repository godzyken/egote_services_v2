import 'dart:developer' as developer;

import 'package:comment_box/comment/comment.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../config/app_shared/images/list_local.dart';
import '../../domain/entities/feedback/feedback.dart';
import '../../domain/providers/feedback/feedback_provider.dart';

class AvisBoxPage extends ConsumerStatefulWidget {
  const AvisBoxPage({super.key, required this.avisId});

  final String avisId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AvisBoxPageState();
}

class _AvisBoxPageState extends ConsumerState<AvisBoxPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  // Widget for displaying each feedback item
  Widget _buildFeedbackTile(AvisUtilisateur feedback) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          developer.log('avis clicked');
        },
        child: CircleAvatar(
          radius: 25,
          backgroundImage: CommentBox.commentImageParser(
            imageURLorPath: feedback.photoUrl ?? LocalImages.foxFaceMeshTexture,
          ),
        ),
      ),
      title: Text(feedback.name?.value ?? "Batman",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(feedback.message),
      trailing: Text(
        feedback.createdAt.toIso8601String(),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  // Fetch feedback using Riverpod
  Widget _buildFeedbackList() {
    final privatePostsFuture = ref.watch(feedbacksProvider);
    return privatePostsFuture.isEmpty
        ? const Center(child: Text('Aucun avis'))
        : ListView.builder(
            itemCount: privatePostsFuture.length,
            itemBuilder: (context, index) {
              final AvisUtilisateur feedback = privatePostsFuture[index];
              return _buildFeedbackTile(feedback);
            },
          );
  }

  // Fetch feedback using Riverpod
  Future<void> _refreshFeedbackList() async {
    // Rafraîchir les avis en appelant le provider
    ref.invalidate(feedbacksProvider);
  }

  // Send a new feedback (avis)
  void _sendAvis(BuildContext context) async {
    try {
      // Vérification si l'utilisateur est authentifié
      final user = await _getUser();

      await verifiedUser(user);

      if (context.mounted) {
        // Si l'avis a été envoyé avec succès, on réinitialise le formulaire
        controller.clear();
        FocusScope.of(context).unfocus();
        developer.log("Avis envoyé avec succès");
      }
    } catch (e) {
      // Log l'erreur si quelque chose se passe mal
      developer.log("Erreur lors de l'envoi de l'avis: $e");
    }
  }

  Future<void> verifiedUser(supabase.User? user) async {
    if (user == null) {
      // Si l'utilisateur n'est pas connecté, on crée un utilisateur anonyme avec des valeurs par défaut
      final anonymousUser = _createAnonymousUser();
      await _addFeedback(controller.text, anonymousUser);
    } else {
      // Si l'utilisateur est authentifié, envoyer l'avis avec les données de l'utilisateur

      await _addFeedback(controller.text, user);
    }
  }

  supabase.User _createAnonymousUser() {
    final inconito = supabase.User(
      id: 'anonymous_${DateTime.now().millisecondsSinceEpoch}', // ID unique temporaire pour l'utilisateur anonyme
      email: 'anonymous@anonymous.com',
      appMetadata: {
        'display_name': 'Utilisateur anonyme',
        'photo_url': LocalImages
            .foxFaceMeshTexture, // Vous pouvez mettre une image par défaut
      },
      userMetadata: {},
      aud: '',
      createdAt: DateTime.now().toIso8601String(),
    );
    return inconito;
  }

  Future<supabase.User?> _getUser() async {
    final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
    final auth = ref.watch(firebaseAuthProvider(firebaseApp));
    final user = auth.currentUser;
    if (user != null) {
      return convertFirebaseUserToSupabaseUser(user);
    }
    return _createAnonymousUser();
  }

  supabase.User convertFirebaseUserToSupabaseUser(
      firebase_auth.User firebaseUser) {
    return supabase.User(
      id: firebaseUser.uid,
      email: firebaseUser.email,
      appMetadata: {
        'display_name': firebaseUser.displayName,
        'photo_url': firebaseUser.photoURL,
      },
      userMetadata: {},
      aud: '',
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  Future<void> _addFeedback(String feedback, supabase.User user) async {
    if (formKey.currentState!.validate()) {
      await ref.read(feedbacksProvider.notifier).addFeedback(feedback, user);
    } else {
      developer.log("Formulaire non validé");
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
    // Récupérer l'utilisateur connecté
    final auth = ref.watch(firebaseAuthProvider(firebaseApp));
    final user = auth.currentUser;

    // Si l'utilisateur est connecté, on récupère son nom et son email
    String userName = user?.displayName ?? 'Utilisateur anonyme';
    String userEmail = user?.email ?? 'email inconnu';

    return Scaffold(
      appBar: AppBar(
        title: Text('${context.tr?.avisPage}'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nom: $userName\nEmail: $userEmail',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          CommentBox(
            userImage: CommentBox.commentImageParser(
              imageURLorPath: LocalImages.foxFaceMeshTexture,
            ),
            labelText: context.tr!.comment,
            errorText: context.tr!.canBeBlank,
            withBorder: false,
            sendButtonMethod: () => _sendAvis(context),
            formKey: formKey,
            commentController: controller,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            sendWidget:
                const Icon(Icons.send_sharp, size: 30, color: Colors.white),
            child: RefreshIndicator(
              onRefresh: _refreshFeedbackList,
              child: _buildFeedbackList(),
            ),
          )
        ],
      ),
    );
  }
}
