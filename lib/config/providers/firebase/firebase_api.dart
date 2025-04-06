import 'package:flutter/services.dart';


import '../../../api/firebase_api.dart';

class FirebaseApi {
  static const MethodChannel _channel =
      MethodChannel('dev.flutter.pigeon.egote_services_v2/Firebase');

  Future<FirebaseResponse> getFirebaseData(FirebaseRequest request) async {
    final Map<String, dynamic> args = <String, dynamic>{
      'message': request.message
    };
    final Map<String, dynamic>? result = await _channel
        .invokeMapMethod<String, dynamic>('getFirebaseData', args);
    return FirebaseResponse(result: result?['result']!);
  }
}
