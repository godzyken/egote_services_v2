import 'dart:convert';

import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_service.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Supabase Instances Providers -------------------> //

final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  try {
    // Charger la configuration à partir d'un fichier JSON
    final configFile = await rootBundle.loadString(F.envFileName, cache: false);
    final env =
        Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

    // Initialiser un client GoTrue pour l'authentification
    final client = supabase.GoTrueClient(
      url: env.supabaseUrl,
      autoRefreshToken: true,
      headers: {
        "apiKey": env.supabaseAnonKey,
        "Authorization": "Bearer ${env.supabaseAnonKey}",
      },
    );

    // Fonction améliorée pour récupérer un token d'accès
    Future<String> getAccessToken() async {
      await Future.delayed(const Duration(seconds: 2));
      String? accessToken = client.currentSession?.providerRefreshToken;

      return accessToken ?? env.accessToken;
    }

    // Initialisation de Supabase avec les options
    await supabase.Supabase.initialize(
      url: env.supabaseUrl,
      anonKey: env.supabaseAnonKey,
      headers: client.headers,
      accessToken: () => getAccessToken(),
      authOptions: const supabase.FlutterAuthClientOptions(
        authFlowType: supabase
            .AuthFlowType.pkce, // Utilisation de PKCE pour l'authentification
      ),
      realtimeClientOptions: const supabase.RealtimeClientOptions(
        logLevel: supabase.RealtimeLogLevel.info,
        eventsPerSecond: 2, // Limitation des événements en temps réel
      ),
      storageOptions: const supabase.StorageClientOptions(
        retryAttempts: 10,
      ),
      postgrestOptions: const supabase.PostgrestClientOptions(schema: 'public'),
      debug: kDebugMode,
    );

    return ref.watch(supabaseProvider);
  } on Exception catch (e) {
    throw StateError('Error initializing Supabase: $e');
  }
}, name: 'Initialisation de supabase provider');

final supabaseProvider =
    Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  // Récupère les données initiales à partir du provider `supabaseInitProvider`
  final supaInit = ref.watch(supabaseInitProvider);

  // Vérifie si le client est disponible et renvoie une exception sinon
  final client = supaInit.value!.client;

  return client;
});

/*final supabaseRealtimeErrorProvider =
    Provider<supabase.SupabaseRealtimeError>((ref) {
  return supabase.SupabaseRealtimeError();
});*/

/*
final supabaseChannelRProvider = Provider((ref){
  final client =
      ref.watch(supabaseClientProvider.select((value) => value.realtime));
  supabase.SupabaseRealtimeError realtimeError =
      ref.watch(supabaseRealtimeErrorProvider);

  ref.onDispose(() {
    client.onOpen(() {
      developer.log('Socket opened.');
      try {
        final listChannels = client
            .getChannels()
            .where((element) => element.presence.channel.canPush)
            .toList();
        final options = client.connState;
        final socket = client.conn;

        for (var chan in listChannels) {
          if (options != null) {
            switch (options) {
              case SocketStates.connecting:
                if (chan.canPush) {
                  Stream? streamChannel = socket?.stream;
                  client.conn?.sink.addStream(streamChannel!);
                  client.onConnMessage('hello 3wi Body!');
                  chan.presenceState();
                } else {
                  chan.unsubscribe();
                  socket?.stream;
                }
              case SocketStates.open:
                if (chan.canPush) {
                  Stream? streamChannel = socket?.stream;
                  client.conn?.sink.addStream(streamChannel!);
                  client.onConnMessage('hello 3wi Body!');
                  chan.subscribe();
                } else {
                  chan.unsubscribe();
                }
              case SocketStates.disconnecting:
                client.conn?.sink
                    .close(socket?.closeCode, realtimeError.message.toString());
                client.onConnMessage('Goodb8 3wi Body! ${socket?.closeReason}');

                chan.unsubscribe();

              case SocketStates.closed:
                client.conn?.sink
                    .close(socket?.closeCode, realtimeError.message.toString());
                client.onConnMessage('Goodb8 3wi Body! ${socket?.closeReason}');

                chan.unsubscribe();
                socket?.stream;
              case SocketStates.disconnected:
                chan.unsubscribe();
            }
          }
          client.removeChannel(chan);
        }
      } on supabase.SupabaseRealtimeError catch (e) {
        realtimeError = e;
        developer.log(realtimeError.toString(),
            error: realtimeError.message, stackTrace: realtimeError.stackTrace);
      }
    });
  });

  ref.onCancel(() {
    client.onClose((p0) {
      client.channels.clear();
    });
  });
});
*/

final supabaseChannelResponseProvider =
    Provider((ref) => supabase.ChannelResponse);

final supabaseChannelFilterProvider =
    Provider((ref) => supabase.RealtimeChannel);

final supabaseServiceProvider =
    Provider<SupabaseService>((ref) => SupabaseService());

final userSupabaseProvider = Provider<supabase.User>((ref) {
  final currentUser = ref.watch(supabaseProvider).client.auth.currentUser;
  return supabase.User(
      id: currentUser!.id,
      appMetadata: currentUser.appMetadata,
      userMetadata: currentUser.userMetadata,
      email: currentUser.email,
      emailConfirmedAt: currentUser.emailConfirmedAt,
      phone: currentUser.phone,
      phoneConfirmedAt: currentUser.phoneConfirmedAt,
      invitedAt: currentUser.invitedAt,
      lastSignInAt: currentUser.lastSignInAt,
      role: currentUser.role,
      identities: currentUser.identities,
      aud: currentUser.aud,
      createdAt: 'createdAt');
});

final linksTypeProvider = StateProvider((_) => supabase.GenerateLinkType);

final filterConnection = StateProvider<List<int>>((ref) {
  final state1 =
      ref.watch(supabaseInitProvider.future).timeout(const Duration(days: 2));
  final state2 = ref.watch(userSupabaseProvider);
  final state3 = ref.watch(userNotifierProvider);

  final stateList = <int, String>{
    1: state1.toString(),
    2: state2.id,
    3: state3.role
  };

  var list = <int>[];

  stateList.forEach((key, value) {
    var checkList = list.add(key);
    return checkList;
  });

  return list;
});

final countProvider = StateProvider<int>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  prefs?.setInt('count', (prefs.getInt('count') ?? 0) + 1);
  return prefs?.getInt('count') ?? 0;
});
