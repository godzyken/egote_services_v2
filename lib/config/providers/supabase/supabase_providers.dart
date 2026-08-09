import 'dart:convert';
import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
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
  final env =
  Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

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
    storageOptions: const supabase.StorageClientOptions(
      retryAttempts: 10,
    ),
    debug: kDebugMode,
  );
}, name: 'Initialisation de supabase provider');

// 2. Accès à l'instance Supabase
final supabaseProvider = Provider<supabase.Supabase>(
      (ref) => supabase.Supabase.instance,
  name: 'SupabaseProvider',
);

// 3. Client Supabase sécurisé (gestion AsyncValue au lieu de Client!)
final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  final supaInit = ref.watch(supabaseInitProvider);
  return supaInit.maybeWhen(
    data: (instance) => instance.client,
    orElse: () => ref.watch(supabaseProvider).client,
  );
}, name: 'Supabase Client Provider');

final supabaseAuthUserProvider = Provider<supabase.AuthUser>(
      (ref) => supabase.AuthUser(
    id: '',
    email: '',
    appMetadata: {},
    aud: '',
    createdAt: '',
    phone: '',
    role: '',
    updatedAt: '',
    userMetadata: {},
    lastSignInAt: '',
    emailConfirmedAt: '',
    phoneConfirmedAt: '',
    confirmedAt: '',
  ),
  name: 'SupabaseAuthUserProvider',
);

final supabaseSocketChannelProvider = Provider(
      (ref) => ref.watch(supabaseProvider).client.realtime.transport,
  name: 'SupabaseSocketChannelProvider',
);

final supabaseRealtimeErrorProvider = Provider<supabase.SupabaseRealtimeError>(
      (ref) => supabase.SupabaseRealtimeError(),
  name: 'SupabaseRealtimeErrorProvider',
);

// 4. Gestion réactive de la socket/canal Realtime
final supabaseChannelRProvider = Provider((ref) {
  final client = ref.watch(supabaseClientProvider).realtime;
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
                client.conn?.sink.close(
                  socket?.closeCode,
                  realtimeError.message.toString(),
                );
                client.onConnMessage(
                  'Goodb8 3wi Body! ${socket?.closeReason}',
                );
                chan.unsubscribe();
              case SocketStates.disconnected:
                chan.unsubscribe();
            }
          }
          client.removeChannel(chan);
        }
      } on supabase.SupabaseRealtimeError catch (e) {
        realtimeError = e;
        developer.log(
          realtimeError.toString(),
          error: realtimeError.message,
          stackTrace: realtimeError.stackTrace,
        );
      }
    });
  });

  ref.onCancel(() {
    client.onClose((p0) {
      client.channels.clear();
    });
  });
});

// 5. Migration des anciens StateProvider vers des Notifier (ou Provider)

// Remplacement de StateProvider pour Type/Enum
class LinksTypeNotifier extends Notifier<Type> {
  @override
  Type build() => supabase.GenerateLinkType;

  void setType(Type newType) => state = newType;
}

final linksTypeNotifierProvider =
NotifierProvider<LinksTypeNotifier, Type>(LinksTypeNotifier.new);

// Remplacement de StateProvider pour filterConnection
class FilterConnectionNotifier extends Notifier<List<int>> {
  @override
  List<int> build() {
    final client = ref.watch(supabaseClientProvider);
    final userState = ref.watch(userNotifierProvider);

    final stateList = <int, String>{
      1: 'initialized',
      2: client.auth.currentUser?.id ?? '',
      3: userState.role,
    };

    return stateList.keys.toList();
  }
}

final filterConnectionNotifierProvider =
NotifierProvider<FilterConnectionNotifier, List<int>>(
  FilterConnectionNotifier.new,
  name: 'FilterConnectionNotifierProvider',
);

// Remplacement de StateProvider pour le compteur persistant
class CountNotifier extends Notifier<int> {
  @override
  int build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getInt('count') ?? 0;
  }

  void increment() {
    state++;
    _save();
  }

  void setCount(int value) {
    state = value;
    _save();
  }

  void _save() {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt('count', state);
  }
}

final countNotifierProvider = NotifierProvider<CountNotifier, int>(
  CountNotifier.new,
  name: 'CountNotifierProvider',
);