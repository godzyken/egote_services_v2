import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/cube_config/cube_config.dart';

const String prefLoginType = "pref_login_type";
const String prefUserLogin = "pref_user_login";
const String prefUserEmail = "pref_user_email";
const String prefUserPhone = "pref_user_phone";
const String prefUserPsw = "pref_user_psw";
const String prefUserName = "pref_user_name";
const String prefUserId = "pref_user_id";
const String prefUserAvatar = "pref_user_avatar";
const String prefSubscriptionToken = "pref_subscription_token";
const String prefSubscriptionId = "pref_subscription_id";
const String prefSelectedDialogId = "pref_selected_dialog_id";

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  late SharedPreferences prefs;

  SharedPrefs._internal();

  bool inited = false;

  static SharedPrefs get instance => _instance;

  Future<SharedPrefs> init() async {
    Completer<SharedPrefs> completer = Completer();

    developer.log(completer.toString());

    if (inited) {
      completer.complete(_instance);
    } else {
      await Future<void>.delayed(const Duration(seconds: 1));
      prefs = await SharedPreferences.getInstance();
      inited = true;
      completer.complete(_instance);
    }
    return completer.future;
  }

  void saveNewUser(CubeUser cubeUser, LoginType loginType) {
    prefs.clear();

    prefs.setString(prefLoginType, loginType.name);

    final login = cubeUser.login;
    if (login != null) prefs.setString(prefUserLogin, login);
    final email = cubeUser.email;
    if (email != null) prefs.setString(prefUserEmail, email);
    final phone = cubeUser.phone;
    if (phone != null) prefs.setString(prefUserPhone, phone);
    final password = cubeUser.password;
    if (password != null) prefs.setString(prefUserPsw, password);
    final fullName = cubeUser.fullName;
    if (fullName != null) prefs.setString(prefUserName, fullName);
    final id = cubeUser.id;
    if (id != null) prefs.setInt(prefUserId, id);
    final avatar = cubeUser.avatar;
    if (avatar != null) prefs.setString(prefUserAvatar, avatar);
  }

  /* startSession(CubeSession cubeSession, bool isStart) async {
    prefs.clear();
    await Future.delayed(
        Duration(minutes: cubeSession.tokenExpirationDate!.minute));
    if (cubeSession.timestamp != 0 && isStart) {
      prefs.setInt(cubeSession.token!, cubeSession.timestamp!);
    } else if (cubeSession.timestamp ==
        cubeSession.tokenExpirationDate!.minute) {
      prefs.clear();
    }
  }*/

  void updateUser(CubeUser cubeUser) {
    final password = cubeUser.password;
    if (password != null) {
      prefs.setString(prefUserPsw, password);
    }
    final login = cubeUser.login;
    if (login != null) prefs.setString(prefUserLogin, login);
    final email = cubeUser.email;
    if (email != null) prefs.setString(prefUserEmail, email);
    final phone = cubeUser.phone;
    if (phone != null) prefs.setString(prefUserPhone, phone);
    final fullName = cubeUser.fullName;
    if (fullName != null) {
      prefs.setString(prefUserName, fullName);
    }
    final avatar = cubeUser.avatar;
    if (avatar != null) {
      prefs.setString(prefUserAvatar, avatar);
    }
  }

  Future<CubeUser?> getUser() {
    if (prefs.getString(prefUserLogin) == null &&
        prefs.getString(prefUserEmail) == null) {
      return Future.value();
    }
    var user = CubeUser()
      ..login = prefs.getString(prefUserLogin)
      ..email = prefs.getString(prefUserEmail)
      ..phone = prefs.getString(prefUserPhone)
      ..password = prefs.getString(prefUserPsw)
      ..fullName = prefs.getString(prefUserName)
      ..id = prefs.getInt(prefUserId)
      ..avatar = prefs.getString(prefUserAvatar);
    return Future.value(user);
  }

  LoginType? getLoginType() {
    var savedLoginType = prefs.getString(prefLoginType);
    if (savedLoginType == null) return null;

    var loginType = LoginType.values.firstWhere(
      (element) => element.name == savedLoginType,
    );

    return loginType;
  }

  void saveLoginType(LoginType loginType) {
    prefs.setString(prefLoginType, loginType.name);
  }

  Future<bool> deleteUser() {
    return prefs.clear();
  }

  void saveSubscriptionToken(String token) {
    prefs.setString(prefSubscriptionToken, token);
  }

  String getSubscriptionToken() {
    return prefs.getString(prefSubscriptionToken) ?? "";
  }

  void saveSubscriptionId(int id) {
    prefs.setInt(prefSubscriptionId, id);
  }

  int getSubscriptionId() {
    return prefs.getInt(prefSubscriptionId) ?? 0;
  }

  void saveSelectedDialogId(String dialogId) {
    prefs.setString(prefSelectedDialogId, dialogId);
  }

  String? getSelectedDialogId() {
    return prefs.getString(prefSelectedDialogId);
  }
}
