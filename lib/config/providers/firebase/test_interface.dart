import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseInitializer {
  Future<FirebaseApp> initialize(String name, FirebaseOptions options);
}

class RealFirebaseInitializer implements FirebaseInitializer {
  @override
  Future<FirebaseApp> initialize(String name, FirebaseOptions options) {
    return Firebase.initializeApp(name: name, options: options);
  }
}
