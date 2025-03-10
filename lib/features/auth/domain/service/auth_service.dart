import 'package:flutter/services.dart';

import '../../../../config/pigeon/dart_api.g.dart';

class AuthService extends ExampleHostApi {
  static const MethodChannel _channel =
      MethodChannel('com.godzy.egote_services_v2.auth_service');

  AuthService({super.binaryMessenger, super.messageChannelSuffix});

  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 5000))
        .then((value) => 'authToken');
  }

  @override
  Future<bool> sendMessage(MessageData message) async {
    try {
      await _channel.invokeMethod('sendMessage', {
        'name': message.name,
        'description': message.description,
        'code': message.code.index,
        'data': message.data,
      });

      return await Future.delayed(
        const Duration(milliseconds: 5000),
        () => true,
      );
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
        details: e.details,
      );
    }
  }

  @override
  Future<String> getHostLanguage() async {
    final String pigeonvarChannelname =
        'dev.flutter.pigeon.egote_services_v2.ExampleHostApi.getHostLanguage';
    final BasicMessageChannel<Object?> pigeonvarChannel =
        BasicMessageChannel<Object?>(
      pigeonvarChannelname,
      ExampleHostApi.pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );

    final List<Object?>? pigeonvarReplylist =
        await pigeonvarChannel.send(null) as List<Object?>?;

    return await Future.delayed(const Duration(milliseconds: 5000))
        .then((value) => pigeonvarReplylist![0]! as String);
  }

  @override
  Future<List<MessageData?>> search(String keyword) async {
    return Future.delayed(const Duration(milliseconds: 5000)).then(
      (value) => Future.value(value),
    );
  }

  @override
  Future<int> add(int a, int b) async {
    return Future.delayed(const Duration(milliseconds: 5000))
        .then((value) => a + b);
  }

  Future<void> logout() async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<bool> isLoggedIn() async {
    return Future.delayed(const Duration(milliseconds: 5000))
        .then((value) => true);
  }

  Future<void> register(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> forgotPassword(String email) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateProfile(String name, String phone) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateEmail(String newEmail) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePassword(String newPassword) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePhone(String newPhone) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePhoto(String newPhoto) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateAddress(String newAddress) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateBio(String newBio) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateWebsite(String newWebsite) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateSocialMedia(String newSocialMedia) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateLocation(String newLocation) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateLanguage(String newLanguage) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateTheme(String newTheme) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateCurrency(String newCurrency) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateTimezone(String newTimezone) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateTimezoneOffset(String newTimezoneOffset) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePushNotifications(bool newPushNotifications) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateEmailNotifications(bool newEmailNotifications) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateSmsNotifications(bool newSmsNotifications) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateAppNotifications(bool newAppNotifications) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateInAppNotifications(bool newInAppNotifications) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePushNotificationsToken(
      String newPushNotificationsToken) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateEmailNotificationsToken(
      String newEmailNotificationsToken) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateSmsNotificationsToken(
      String newSmsNotificationsToken) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateAppNotificationsToken(
      String newAppNotificationsToken) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateInAppNotificationsToken(
      String newInAppNotificationsToken) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePushNotificationsEnabled(
      bool newPushNotificationsEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateEmailNotificationsEnabled(
      bool newEmailNotificationsEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateSmsNotificationsEnabled(
      bool newSmsNotificationsEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateAppNotificationsEnabled(
      bool newAppNotificationsEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateInAppNotificationsEnabled(
      bool newInAppNotificationsEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updatePushNotificationsTokenEnabled(
      bool newPushNotificationsTokenEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateEmailNotificationsTokenEnabled(
      bool newEmailNotificationsTokenEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateSmsNotificationsTokenEnabled(
      bool newSmsNotificationsTokenEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateAppNotificationsTokenEnabled(
      bool newAppNotificationsTokenEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateInAppNotificationsTokenEnabled(
      bool newInAppNotificationsTokenEnabled) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateProfilePicture(String newProfilePicture) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateCoverPicture(String newCoverPicture) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateBannerPicture(String newBannerPicture) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateProfilePictureUrl(String newProfilePictureUrl) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateCoverPictureUrl(String newCoverPictureUrl) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }

  Future<void> updateBannerPictureUrl(String newBannerPictureUrl) async {
    return Future.delayed(const Duration(milliseconds: 5000));
  }
}
