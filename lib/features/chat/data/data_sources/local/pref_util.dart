import 'dart:async';
import 'dart:developer' as developer;

// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/cube_config/cube_config.dart';
import '../../../domain/models/entities/cube_user/cube_user_mig.dart';

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

  saveNewUser(CubeUserMig cubeUser, LoginType loginType) {
    prefs.clear();

    prefs.setString(prefLoginType, loginType.name);

    if (cubeUser.login != null) prefs.setString(prefUserLogin, cubeUser.login!);
    if (cubeUser.email != null) prefs.setString(prefUserEmail, cubeUser.email!);
    if (cubeUser.phone != null) prefs.setString(prefUserPhone, cubeUser.phone!);
    if (cubeUser.password != null) {
      prefs.setString(prefUserPsw, cubeUser.password!);
    }
    if (cubeUser.fullName != null) {
      prefs.setString(prefUserName, cubeUser.fullName!);
    }
    prefs.setInt(prefUserId, cubeUser.id!);
    if (cubeUser.avatar != null) {
      prefs.setString(prefUserAvatar, cubeUser.avatar!);
    }
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

  updateUser(CubeUserMig cubeUser) {
    if (cubeUser.password != null) {
      prefs.setString(prefUserPsw, cubeUser.password!);
    }
    if (cubeUser.login != null) prefs.setString(prefUserLogin, cubeUser.login!);
    if (cubeUser.email != null) prefs.setString(prefUserEmail, cubeUser.email!);
    if (cubeUser.phone != null) prefs.setString(prefUserPhone, cubeUser.phone!);
    if (cubeUser.fullName != null) {
      prefs.setString(prefUserName, cubeUser.fullName!);
    }
    if (cubeUser.avatar != null) {
      prefs.setString(prefUserAvatar, cubeUser.avatar!);
    }
  }

  Future<CubeUserMig?> getUser() {
    if (prefs.getString(prefUserLogin) == null &&
        prefs.getString(prefUserEmail) == null) return Future.value();
    var user = const CubeUserMig();
/*    user.login = prefs.getString(prefUserLogin);
    user.email = prefs.getString(prefUserEmail);
    user.phone = prefs.getString(prefUserPhone);
    user.password = prefs.getString(prefUserPsw);
    user.fullName = prefs.getString(prefUserName);
    user.id = prefs.getInt(prefUserId);
    user.avatar = prefs.getString(prefUserAvatar);*/
    return Future.value(user);
  }

  LoginType? getLoginType() {
    var savedLoginType = prefs.getString(prefLoginType);
    if (savedLoginType == null) return null;

    var loginType = LoginType.values
        .firstWhere((element) => element.name == savedLoginType);

    return loginType;
  }

  saveLoginType(LoginType loginType) {
    prefs.setString(prefLoginType, loginType.name);
  }

  Future<bool> deleteUser() {
    return prefs.clear();
  }

  saveSubscriptionToken(String token) {
    prefs.setString(prefSubscriptionToken, token);
  }

  String getSubscriptionToken() {
    return prefs.getString(prefSubscriptionToken) ?? "";
  }

  saveSubscriptionId(int id) {
    prefs.setInt(prefSubscriptionId, id);
  }

  int getSubscriptionId() {
    return prefs.getInt(prefSubscriptionId) ?? 0;
  }

  saveSelectedDialogId(String dialogId) {
    prefs.setString(prefSelectedDialogId, dialogId);
  }

  String? getSelectedDialogId() {
    return prefs.getString(prefSelectedDialogId);
  }
}
