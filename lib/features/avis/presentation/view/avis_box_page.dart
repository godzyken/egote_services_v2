import 'dart:developer' as developer;

import 'package:comment_box/comment/comment.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/app_shared/images/list_local.dart';
import '../../domain/entities/feedback/feedback.dart';
import '../../domain/providers/feedback/feedback_provider.dart';

// Alias pour différencier les deux classes User
typedef FirebaseUser = firebase_auth.User;
typedef SupabaseUser = supabase.User;

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
    ref.read(feedbacksProvider.notifier).loadFeedbacks();
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
      title: Text(feedback.name!,
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
    return ListView.builder(
      itemCount: privatePostsFuture.length,
      itemBuilder: (context, index) {
        final AvisUtilisateur feedback = privatePostsFuture[index];
        return _buildFeedbackTile(feedback);
      },
    );
  }

  // Send a new feedback (avis)
  void _sendAvis(BuildContext context) async {
    final auth = ref.watch(authStreamProvider);
    User? user = convertFirebaseUserToSupabaseUser(auth.value!);

    if (formKey.currentState!.validate()) {
      final value = controller.text;
      setState(() {
        ref.read(feedbacksProvider.notifier).addFeedback(value, user);
        controller.clear();
      });
      FocusScope.of(context).unfocus();
      developer.log("Avis envoyé avec succès");
    } else {
      developer.log("Formulaire non validé");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.tr?.avisPage}'),
        backgroundColor: Colors.pink,
      ),
      body: CommentBox(
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
        sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        child: _buildFeedbackList(),
      ),
    );
  }
}
