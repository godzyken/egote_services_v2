import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_client/src/constants.dart' hide Constants;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Supabase Instances Providers -------------------> //

// 1. Initialisation asynchrone de Supabase
final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  final configFile = await rootBundle.loadString(F.envFileName, cache: false);
  final env = Environment.fromJson(
    json.decode(configFile) as Map<String, dynamic>,
  );

  final client = supabase.GoTrueClient(
    url: env.supabaseUrl,
    autoRefreshToken: true,
    headers: {
      "apiKey": env.supabaseAnonKey,
      "Authorization": "Bearer ${env.supabaseAnonKey}",
    },
  );

  return await supabase.Supabase.initialize(
    url: env.supabaseUrl,
    anonKey: env.supabaseAnonKey,
    headers: client.headers,
    authOptions: const supabase.FlutterAuthClientOptions(
      authFlowType: supabase.AuthFlowType.pkce,
    ),
    realtimeClientOptions: const supabase.RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
      eventsPerSecond: 2,
    ),
    storageOptions: const supabase.StorageClientOptions(retryAttempts: 10),
    debug: kDebugMode,
  );
}, name: 'Initialisation de supabase provider');

// 2. Accès à l'instance Supabase
final supabaseProvider = Provider<supabase.Supabase>(
  (ref) => supabase.Supabase.instance,
  name: 'SupabaseProvider',
);

// 3. Client Supabase sécurisé
final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  final supaInit = ref.watch(supabaseInitProvider);
  return supaInit.maybeWhen(
    data: (instance) => instance.client,
    orElse: () => ref.watch(supabaseProvider).client,
  );
}, name: 'Supabase Client Provider');

final supabaseUserProvider = Provider<supabase.User?>(
  (ref) => ref.watch(supabaseClientProvider).auth.currentUser,
  name: 'SupabaseUserProvider',
);

final supabaseSocketChannelProvider = Provider(
  (ref) => ref.watch(supabaseProvider).client.realtime.transport,
  name: 'SupabaseSocketChannelProvider',
);

final supabaseRealtimeErrorProvider = Provider<Object?>(
  (ref) => null,
  name: 'SupabaseRealtimeErrorProvider',
);

// 4. Gestion réactive de la socket/canal Realtime
final supabaseChannelRProvider = Provider((ref) {
  final client = ref.watch(supabaseClientProvider).realtime;

  ref.onDispose(() {
    client.onOpen(() {
      developer.log('Socket opened.');
      try {
        final listChannels =
            client
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
              case SocketStates.closed:
                client.conn?.sink.close(socket?.closeCode, 'socket_closed');
                client.onConnMessage('Goodbye! ${socket?.closeReason}');
                chan.unsubscribe();
              case SocketStates.disconnected:
                chan.unsubscribe();
            }
          }
          client.removeChannel(chan);
        }
      } catch (e) {
        developer.log('Realtime socket exception: $e');
      }
    });
  });

  ref.onCancel(() {
    client.onClose((p0) {
      client.channels.clear();
    });
  });

  return client;
});
