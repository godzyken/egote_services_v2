import 'dart:developer' as developer;
import 'dart:isolate';

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

  // Simplified error handling
  void logError(Object e) => AuthErrorHandler.handleError(e);

  // Initialize the feedback loading and stream listening
  void _startListening() async {
    ref.watch(supabaseClientProvider).getChannels();
    ref.keepAlive();
    await loadFeedbacks();
  }

  // Load feedbacks from Supabase
  Future<void> loadFeedbacks() async {
    final stopwatch = Stopwatch()..start();
    developer.log('Loading feedbacks...');
    try {
      final response = await fetchList();
      state = response.isEmpty
          ? []
          : response.map((item) => AvisUtilisateur.fromJson(item)).toList();

      stopwatch.stop();
      developer.log('Feedbacks loaded in ${stopwatch.elapsedMilliseconds}ms');
    } on PostgrestException catch (e) {
      developer.log('Error loading feedbacks: ${e.message}');
      logError(e);
      state = [];
      stopwatch.stop();
      developer.log(
          'Feedbacks loading failed in ${stopwatch.elapsedMilliseconds}ms');
    }
  }

  // Fetch the list of feedbacks from Supabase
  Future<List<Map<String, dynamic>>> fetchList() async {
    try {
      final response =
          await ref.watch(supabaseClientProvider).from('avis_posts').select();
      return response.isEmpty ? [] : List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (e) {
      developer.log('Error fetching feedbacks: ${e.message}');
      logError(e);
      return [];
    }
  }

  // Add a feedback
  Future<void> addFeedback(String content, User user) async {
    try {
      final newFeedback = AvisUtilisateur(
        id: int.parse(user.id),
        name: user.appMetadata['display_name'],
        photoUrl: user.appMetadata['photo_url'],
        message: content,
        createdAt: DateTime.now(),
        isAnonymous: user.isAnonymous,
      );

      developer.debugger(
          message: '[Adding Feedback]: $newFeedback', when: true);
      await _insertFeedback(newFeedback);
      state = [...state, newFeedback];
    } on PostgrestException catch (e) {
      developer.log('Error adding feedback: ${e.message}');
      logError(e);
      state = [];
    }
  }

  // Insert feedback into Supabase
  Future<PostgrestResponse> _insertFeedback(AvisUtilisateur feedback) async {
    try {
      return await ref
          .read(supabaseClientProvider)
          .from('avis_posts')
          .insert(feedback.toJson());
    } on PostgrestException catch (e) {
      developer.log('Error inserting feedback: ${e.message}');
      logError(e);
      rethrow;
    }
  }

  // Execute the background operation in an isolate
  Future<void> executeInBackground(SendPort sendPort) async {
    try {
      final response = await fetchList();
      sendPort.send(response.toString());
    } catch (error) {
      sendPort.send({'error': error.toString()});
    }
  }

  // Perform Supabase operation in the background using an Isolate
  Future<void> performSupabaseOperation() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(executeInBackground, receivePort.sendPort);

    receivePort.listen((data) {
      if (data is Map && data.containsKey('error')) {
        developer.log('Error during Supabase operation: ${data['error']}');
      } else {
        developer.log('Supabase operation result: $data');
      }
      receivePort.close();
    });
  }

  // Perform multiple async operations and wait for their completion
  Future<void> performMultipleAsyncOperations() async {
    try {
      final fetch = fetchList();
      final insert = _insertFeedback(AvisUtilisateur.fromJson({}));

      final results = await Future.wait([fetch, insert]);
      developer
          .log('Multiple async operations completed successfully: $results');
    } catch (error) {
      developer.log('Error during multiple async operations: $error');
    }
  }

  // Perform async operations using multiple isolates
  Future<void> performAsyncOperationWithIsolate() async {
    final receivePort1 = ReceivePort();
    final receivePort2 = ReceivePort();

    await Isolate.spawn(executeInBackground, receivePort1.sendPort);
    await Isolate.spawn(executeInBackground, receivePort2.sendPort);

    final result = await Future.any([
      receivePort1.first,
      receivePort2.first,
    ]);

    developer
        .log('Async operation with Isolate completed successfully: $result');

    // Handle responses from both isolates
    _handleIsolateResponse(receivePort1);
    _handleIsolateResponse(receivePort2);
  }

  // Handle the response from an isolate
  void _handleIsolateResponse(ReceivePort receivePort) {
    receivePort.listen((data) {
      if (data is Map && data.containsKey('error')) {
        developer.log('Error during async operation: ${data['error']}');
      } else {
        developer.log('Async operation result: $data');
      }
      receivePort.close();
    });
  }
}
