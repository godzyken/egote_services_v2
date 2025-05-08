import 'dart:isolate';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:egote_services_v2/config/providers/firebase/test_interface.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class MockSentryService extends Mock implements SentryService {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

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

/// Interface de service à mocker
abstract class InitService {
  Future<String> initialize();
}

/// Mock de ce service
class MockInitService extends Mock implements InitService {}

/// Paramètres à envoyer à l'isolate
class MockParams {
  final SendPort sendPort;
  final RootIsolateToken token;
  final InitService service;

  MockParams({
    required this.sendPort,
    required this.token,
    required this.service,
  });
}

class MockEnvironment extends Fake implements Environment {
  @override
  Map<String, dynamic> toJson() => {
        "appFlavor": "development",
        "supabaseUrl": "https://ltcnlgqoeunywzlewydv.supabase.co",
        "supabaseAnonKey":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx0Y25sZ3FvZXVueXd6bGV3eWR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1OTA1OTUsImV4cCI6MjA1NDE2NjU5NX0.K1N1vp8TUxWypnT8o1ImN-hXkRli8OFhXvfMdTfKCrQ",
        "supabaseAuthCallbackUrlHostname":
            "psql -h db.zngannbhansflbwydrgw.supabase.co -p 5432 -d postgres -U postgres",
        "appId": "6636",
        "authKey": "NOxn7L48BZ5Ogyx",
        "authSecret": "7f7HuaHu27NAygw",
        "vapidKey":
            "BLpyg4ATQCD5NbPqKOXAeXT_tcdedTdJVPPIUszMjHIdJoCJO0cst-0LJjShiUPYPAUP3d_FuW7C_Jwpag8AAk0",
        "outpoint": "https://api.connectycube.com",
        "clientToken": "pub8f8371ed662182de9c831bb02d76a453",
        "site": "DatadogSite.eu1",
        "applicationId": "2227b118-86ad-46a7-a526-c0666cb2ee4c",
        "firstPartyHosts": ["zngannbhansflbwydrgw.supabase.co"],
        "dataDogApiKey": "a0ec4dc09cc7b7f07db9822bd50d810f",
        "accessToken": "sbp_1ab3d516d00ca0f129246c64d116d3fc5791bc35",
        "cubeApiKey": "NZwgfjnjugLku66YXEzE",
        "chatEndpoint": "chat.connectycube.com",
        "materialBankApiKey": "UAQwIiV7vmIl6tT6nIBgXJzoTxiRYsAn",
        "materialBankBaseUrl": "https://search.materialbank.eu"
      };
}

class FakeFirebaseApp extends Fake implements FirebaseApp {}

class MockFirebaseInitializer extends Mock implements FirebaseInitializer {}
