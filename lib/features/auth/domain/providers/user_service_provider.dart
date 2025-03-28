import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/user_service.dart';

final userServiceProvider =
    Provider<FirebaseAuthService>((ref) => FirebaseAuthService());
