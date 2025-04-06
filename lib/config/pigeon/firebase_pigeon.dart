class FirebaseRequest {
  FirebaseRequest({required this.message});
  final String message;
}

class FirebaseResponse {
  FirebaseResponse({required this.result});
  final String result;
}

abstract class FirebaseApi {
  FirebaseResponse getFirebaseData(FirebaseRequest request);
}
