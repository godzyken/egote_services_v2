class User {
  String? name;
  int? age;
}

abstract class Api {
  User getUserInfo();
  User? signInWithEmail(String email, String password);
}
