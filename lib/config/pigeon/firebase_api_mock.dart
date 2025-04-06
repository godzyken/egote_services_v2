import '../pigeon/firebase_pigeon.dart';

class FirebaseApiMock implements FirebaseApi {
  @override
  FirebaseResponse getFirebaseData(FirebaseRequest request) {
    return FirebaseResponse(result: 'Réponse de Firebase : ${request.message}');
  }
}
