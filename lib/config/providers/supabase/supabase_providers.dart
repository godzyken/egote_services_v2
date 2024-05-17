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
          authFlowType: supabase.AuthFlowType.pkce),
      // authCallbackUrlHostname: env.supabaseAuthCallbackUrlHostname,
      realtimeClientOptions: const supabase.RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
        eventsPerSecond: 2,
      ),
      storageOptions: const supabase.StorageClientOptions(
        retryAttempts: 10,
      ),
      debug: kDebugMode);
}, name: 'Initialisation de supabase provider');

final supabaseProvider =
    Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  final supaInit = ref.watch(supabaseInitProvider);
  final client = supaInit.value?.client;
  return client!;
},
    dependencies: [supabaseProvider, supabaseInitProvider],
    name: 'Supabase Client Provider');

final supabaseAuthUserProvider =
    Provider<supabase.AuthUser>((ref) => supabase.AuthUser(
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
        ));

final supabaseSocketChannelProvider =
    Provider((ref) => ref.watch(supabaseProvider).client.realtime.transport);

final supabaseRealtimeErrorProvider =
    Provider<supabase.SupabaseRealtimeError>((ref) {
  return supabase.SupabaseRealtimeError();
});

final supabaseChannelRProvider = Provider((ref) {
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
              case SocketStates.closing:
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
final supabaseChannelResponseProvider =
    Provider((ref) => supabase.ChannelResponse);

final supabaseChannelFilterProvider =
    Provider((ref) => supabase.RealtimeChannel);

final linksTypeProvider = StateProvider((_) => supabase.GenerateLinkType);

/*final supabaseCreateAuthProvider = Provider<supabase.AuthUser>((ref) {
  final users = ref.watch(userNotifierProvider);
  final authInit = ref.watch(supabaseAuthUserProvider);
  final filter = ref.watch(linksTypeProvider);
  final change = ref.read(userChangesProvider);

  switch(filter) {
    case
  }

  return authInit;
});

final supabaseUsersListProvider = Provider<List<supabase.SupabaseAuth>>((ref) {
  final users = ref.watch(userNotifierProvider);


  final auths = ref.watch(su)
},);*/

final filterConnection = StateProvider<List<int>>((ref) {
  final state1 =
      ref.watch(supabaseInitProvider.future).timeout(const Duration(days: 2));
  final state2 = ref.watch(supabaseClientProvider);
  final state3 = ref.watch(userNotifierProvider);

  final stateList = <int, String>{
    1: state1.toString(),
    2: state2.auth.currentUser!.id,
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
  final prefs = ref.watch(sharedPreferencesProvider);
  final currentValue = prefs.getInt('count') ?? 0;
  ref.listenSelf((previous, next) {
    prefs.setInt('cont', next);
  });
  return currentValue;
});
