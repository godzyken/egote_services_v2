import 'dart:convert';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:egote_services_v2/features/chat/application/controllers/cube_user_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/environements/environment.dart';
import '../../../../../config/environements/flavors.dart';
import '../../../../../config/providers/cube/cube_providers.dart';
import '../../../../config/cube_config/cube_config.dart';
import '../../data/data_sources/local/pref_util.dart';
import '../../infrastructure/repositories/cube_repository.dart';

final cubeSettingsInitProvider = FutureProvider<CubeSettings>((ref) async {
  final configFile = await rootBundle.loadString(F.envFileName);
  final env =
  Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  final settings = ref.watch(cubeSettingsProvider);

  settings.applicationId = env.appId;
  settings.authorizationKey = env.authKey;
  settings.authorizationSecret = env.authSecret;
  settings.applicationId = env.appId;
  settings.isDebugEnabled = true;
  settings.isJoinEnabled = true;

  await settings.setEndpoints(settings.apiEndpoint, settings.chatEndpoint);

  await settings.init(env.appId, env.authKey, env.authSecret,
      onSessionRestore: () async {
        SharedPrefs preferences = await SharedPrefs.instance.init();

        if (LoginType.phone == preferences.getLoginType()) {
          return ref.read(cubeRepositoryProvider).createPhoneAuthSession();
        }

        return await preferences
            .getUser().then((value) =>
            ref.read(cubeRepositoryProvider).restoreSession());
      });

  return settings;
}, dependencies: [cubeSettingsProvider], name: 'Cube settings init provider');


final cubeUserControllerProvider =
StateNotifierProvider<CubeUserController, CubeUser?>(
        (ref) => CubeUserController(ref),
    dependencies: [autoAuthControllerProvider, userNotifierProvider],
    name: 'cube user authentication state notifier');

final filterLoginTypeStateNotifier =
StateNotifierProvider.autoDispose<FilterLoginTypeView, LoginType>(
        (ref) => FilterLoginTypeView());

class FilterLoginTypeView extends StateNotifier<LoginType> {
  FilterLoginTypeView() : super(LoginType.facebook);

  filterByPhone() => state = LoginType.phone;

  filterByEmail() => state = LoginType.email;

  filterByLogin() => state = LoginType.login;

  filterByFacebook() => state = LoginType.facebook;

  bool isFilterByPhone() => state == LoginType.phone;

  bool isFilterByEmail() => state == LoginType.email;

  bool isFilterByLogin() => state == LoginType.login;

  bool isFilterByFacebook() => state == LoginType.facebook;
}
