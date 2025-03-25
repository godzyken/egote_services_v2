import 'package:connectycube_sdk/connectycube_pushnotifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../chat/data/data_sources/local/pref_util.dart';

class SubscriptionService {
  final SharedPrefs _sharedPrefs;

  SubscriptionService(this._sharedPrefs);

  Future<void> subscribe(
      String token, String deviceId, String? bundleIdentifier) async {
    // Logic to create and handle the subscription with the Cube SDK
    CreateSubscriptionParameters parameters = CreateSubscriptionParameters();
    parameters.pushToken = token;
    parameters.udid = deviceId;
    parameters.bundleIdentifier = bundleIdentifier;

    // More subscription logic...
    await createSubscription(parameters.getRequestParameters());
  }

  Future<void> unsubscribe() async {
    int subscriptionId = _sharedPrefs.getSubscriptionId();
    if (subscriptionId != 0) {
      await deleteSubscription(subscriptionId);
      await FirebaseMessaging.instance.deleteToken();
      _sharedPrefs.saveSubscriptionId(0);
    }
  }
}
