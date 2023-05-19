class AuthService {
  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 5000))
        .then((value) => 'authToken');
  }
}
