import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CubeUserController extends StateNotifier<CubeUser?> {
  CubeUserController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  void _updateState(CubeUser? newState) {
    state = newState;
  }

  void _logError(AuthException e, {StackTrace? stackTrace}) {
    developer.log(
        'AuthException code: ${e.code}\n'
        'Runtime Type: ${e.runtimeType}\n'
        'Status code: ${e.statusCode}\n'
        'CubeUserController error message: ${e.message}',
        stackTrace: stackTrace);
  }

  Future<void> _initialize() async {
    _updateState(null);

    try {
      final userModelEntity = _ref.watch(userNotifierProvider.notifier);
      final authModelEntity = _ref.watch(autoAuthControllerProvider);

      do {
        _updateState(CubeUser(
          id: authModelEntity?.userEntityModel.id.value,
          fullName: authModelEntity?.userEntityModel.name,
          email: authModelEntity?.userEntityModel.email,
          login: authModelEntity?.userEntityModel.name,
          externalId: int.parse(authModelEntity!.userEntityModel.externalLink),
          phone: authModelEntity.userEntityModel.phone,
        ));
      } while (userModelEntity.previousStates.last.id == authModelEntity.id);
    } on AuthException catch (e) {
      _logError(e, stackTrace: StackTrace.fromString(e.message));
      _updateState(null);
    }
  }
}
