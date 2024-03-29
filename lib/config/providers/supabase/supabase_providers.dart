import 'dart:convert';
import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_client/src/constants.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Supabase Instances Providers -------------------> //

final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  final configFile = await rootBundle.loadString(F.envFileName);
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
    // authFlowType: supabase.AuthFlowType.pkce,
    debug: kDebugMode,
    // authCallbackUrlHostname: env.supabaseAuthCallbackUrlHostname,
    realtimeClientOptions: const RealtimeClientOptions(
      eventsPerSecond: 2,
    ),
    headers: client.headers,

  );
}, name: 'Initialisation de supabase provider');

final supabaseProvider =
Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>(
        (ref) =>
    ref
        .read(supabaseInitProvider)
        .asData!
        .value
        .client,
    dependencies: [supabaseProvider, supabaseInitProvider],
    name: 'Supabase Client Provider');

final supabaseAuthUserProvider =
Provider<supabase.AuthUser>((ref) =>
    supabase.AuthUser(
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
Provider((ref) =>
ref
    .watch(supabaseProvider)
    .client
    .realtime
    .transport);

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
            .where((element) => element.topic.contains('room_status'))
            .toList();
        final options = client.connState;
        final socket = client.conn;

        for (var chan in listChannels) {
          if (chan.socket.connState != null) {
            if (chan.joinedOnce) {
              Stream? streamChannel = socket?.stream;
              client.conn?.sink.addStream(streamChannel!);
              client.onConnMessage(chan.joinRef);
            }
            chan.unsubscribe();
            socket?.stream;
          }
          client.removeChannel(chan);
        }

        switch (options) {
          case null:
          // TODO: Handle this case.
          case SocketStates.connecting:
          // TODO: Handle this case.
          case SocketStates.open:
          // TODO: Handle this case.
          case SocketStates.closing:
          // TODO: Handle this case.
          case SocketStates.closed:
          // TODO: Handle this case.
          case SocketStates.disconnected:
          // TODO: Handle this case.
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

final supabaseChannelFilterProvider = Provider((ref) =>
supabase.RealtimeChannel);

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

final filterConnection = StateProvider((_) {
  final state1 = _.watch(supabaseInitProvider);
  final state2 = _.watch(supabaseClientProvider);
  final state3 = _.watch(userNotifierProvider);
});

final countProvider = StateProvider<int>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final currentValue = prefs.getInt('count') ?? 0;
  ref.listenSelf((previous, next) {
    prefs.setInt('cont', next);
  });
  return currentValue;
});
