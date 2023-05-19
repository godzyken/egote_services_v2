import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/domain/failures/failure.dart';

class AuthTokenLocalDataSource {
  AuthTokenLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  static const _key = 'auth_token';

  Either<Failure, String> get() {
    final v = _prefs.getString(_key);
    if (v == null) {
      return left(Failure.empty());
    }

    return right(v);
  }

  Future<bool> store(String token) async {
    return _prefs.setString(_key, token);
  }

  Future<bool> remove() async {
    return _prefs.remove(_key);
  }
}
