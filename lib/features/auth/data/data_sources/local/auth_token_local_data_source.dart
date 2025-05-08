import 'package:fpdart/fpdart.dart';

import '../../../../chat/data/data_sources/local/pref_util.dart';
import '../../../../common/domain/failures/failure.dart';

class AuthTokenLocalDataSource {
  AuthTokenLocalDataSource(this._prefs);

  final SharedPrefs _prefs;

  static const _key = 'auth_token';

  Either<Failure, String> get() {
    final v = _prefs.prefs.getString(_key);
    if (v!.isEmpty) {
      return left(Failure.empty());
    }

    return right(v);
  }

  Future<bool> store(String token) async {
    return _prefs.prefs.setString(_key, token);
  }

  Future<bool> remove() async {
    return _prefs.prefs.remove(_key);
  }
}
