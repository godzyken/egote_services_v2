import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../feedback.dart';

final feedbackProvider =
    StateNotifierProvider<FeedbackNotifier, AsyncValue<List<Feedback>>>((ref) {
  final read = Reader((r) => r);
  return FeedbackNotifier(read);
});

class FeedbackNotifier extends StateNotifier<AsyncValue<List<Feedback>>> {
  FeedbackNotifier(this._read) : super(const AsyncValue.loading()) {
    loadFeedbacks();
  }

  late final Reader _read;
  Ref? ref;
  final user = currentProvider.notifier;

  Future<void> submitFeedback(String content, bool isAnonymous) async {
    try {
      final userName = isAnonymous
          ? null
          : user
              .select(
                (value) => value.state!.name,
              )
              .toString();

      final id = Uuid().v4();
      final createdAt = DateTime.now();

      final newFeedback = Feedback(
        id: id,
        name: userName,
        message: content,
        photoUrl: null,
        createdAt: createdAt,
        isAnonymous: isAnonymous,
      );

      final response = await database(newFeedback, ref!);

      if (response.error != null) {
        throw Exception('Error inserting feedback: ${response.error!.message}');
      }

      state = AsyncValue.data([...state.value ?? [], newFeedback]);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<dynamic> database(Feedback newFeedback, Ref ref) async {
    return await ref
        .read(supabaseClientProvider)
        .from('avis_posts')
        .insert(newFeedback.toMap());
  }

  Future<void> loadFeedbacks() async {
    try {
      final response = await fectchList(ref!);
      if (response.isNotEmpty) {
        throw Exception(
            'Error loading feedbacks: ${response.singleOrNull.toString()}');
      }

      final feedbacks = (response.firstOrNull as List)
          .map((data) => Feedback.fromMap(data as Map<String, dynamic>))
          .toList();

      state = AsyncValue.data(feedbacks);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<PostgrestList> fectchList(Ref ref) async {
    return await ref
        .watch(supabaseClientProvider)
        .from('avis_posts')
        .select('*');
  }
}
