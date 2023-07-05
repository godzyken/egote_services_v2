import 'dart:convert';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app_shared/extensions/consts.dart';
import '../../../../../config/environements/environment.dart';
import '../../../../../config/environements/flavors.dart';
import '../../../../../config/providers/cube/cube_providers.dart';
import '../../../../../config/providers/firebase/firebase_providers.dart';
import '../../../data/data_sources/local/pref_util.dart';

final cubeSettingsInitProvider = FutureProvider<CubeSettings>((ref) async {
  final configFile = await rootBundle.loadString(F.envFileName);
  final env = Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  final settings = ref.watch(cubeSettingsProvider);

  await settings.setEndpoints(settings.apiEndpoint, settings.chatEndpoint);

  final firebaseOptions = DefaultFirebaseOptions.currentPlatform;

  final accessToken = await ref.watch(firebaseMessagingProvider)
      .getToken(vapidKey: env.vapidKey);


  return await settings
      .init(
    env.appId,
    env.authKey,
    env.authSecret,
    onSessionRestore: () async {
      SharedPrefs preferences = await SharedPrefs.instance.init();

      if (LoginType.email == preferences.getLoginType()) {
        return createSessionUsingFirebase(firebaseOptions.projectId, accessToken!);
      }

      return createSession(preferences.getUser());
    },
  );
});