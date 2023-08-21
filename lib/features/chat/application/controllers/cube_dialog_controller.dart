import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeDialogController extends StateNotifier<CubeDialog?> {
  CubeDialogController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  Future<void> _initialize() async {
  }

}

class CubeDialogStateController extends StateNotifier<CubeChatConnectionState> {
  CubeDialogStateController(this.ref) : super(CubeChatConnectionState.Idle);

  final Ref ref;



}