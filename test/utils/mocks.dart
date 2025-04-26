import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class MockSentryService extends Mock implements SentryService {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockSupabase extends Mock implements Supabase {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockSupabaseClient extends Mock implements SupabaseClient {
  @override
  GoTrueClient get auth => MockGoTrueClient();
}

// Mock de l'authentification Supabase
class MockSupabaseAuth extends Mock implements AuthResponse {
  void startAutoRefresh() {}
}

class MockSupabaseInitResult extends Mock {
  Future<Supabase> initSupabase() async {
    // Mock behavior for Supabase init result
    return MockSupabase(); // You can return the mock object itself for testing purposes
  }

  SupabaseClient get client => MockSupabaseClient();
}

class MockRef extends Mock implements Ref {}

class MockGoRouterState extends Mock implements GoRouterState {
  @override
  final Uri uri;

  MockGoRouterState(String path) : uri = Uri.parse(path);

  @override
  String? get path => uri.path;
}

class MockBuildContext extends Mock implements BuildContext {}
