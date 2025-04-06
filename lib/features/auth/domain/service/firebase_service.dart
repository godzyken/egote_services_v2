import 'package:flutter/services.dart';

class FirebaseService {
  static const platform = MethodChannel('com.godzy.egote_services_v2/firebase');

  Future<String> getFirebaseData(String message) async {
    try {
      final result =
          await platform.invokeMethod('getFirebaseData', {'message': message});
      return result;
    } on PlatformException catch (e) {
      return "Failed to get data from Firebase: ${e.message}";
    }
  }
}
