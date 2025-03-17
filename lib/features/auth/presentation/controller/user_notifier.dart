import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/states/user/user_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class UserNotifier extends StateNotifier<UserEntityModel> {
  UserNotifier([UserEntityModel? userEntityModel])
      : super(userEntityModel ?? UserEntityModel.empty());

  final List<UserEntityModel> _previousStates = [];

  void updateName(String name) {
    _savePreviousState();
    state = state.copyWith(name: name);
  }

  void updateRole(String role) {
    _savePreviousState();
    state = state.copyWith(role: role);
  }

  void updateUser({
    String? name,
    String? role,
    String? externalId,
    String? phone,
    String? externalLink,
  }) {
    _savePreviousState();
    state = state.copyWith(
      name: name ?? state.name,
      role: role ?? state.role,
      externalId: externalId ?? state.externalId,
      phone: phone ?? state.phone,
      externalLink: externalLink ?? state.externalLink,
    );
  }

  void _savePreviousState() {
    _previousStates.add(state);
  }

  void revertToPreviousState() {
    if (_previousStates.isNotEmpty) {
      state = _previousStates.removeLast();
    }
  }

  List<UserEntityModel> get previousStates => _previousStates;
}

class UserFormStateController extends StateNotifier<UserFormState> {
  UserFormStateController() : super(UserFormState(UserEntityModel.empty()));

  FormzSubmissionStatus? isUser(UserEntityModel? userEntityModel) {
    if (userEntityModel!.name.isNotEmpty) {
      state = state.copyWith(userEntityModel: userEntityModel);
    }
    return null;
  }

  void addUser(UserEntityModel u) async {
    UserEntityModel form = state.userEntityModel.copyWith(name: u.name);

    late UserEntityModel user;

    if (form.name.isNotEmpty) {
      user = form;
      state = state.copyWith(userEntityModel: user);
    }
  }
}

final clockProvider = StateProvider((ref) => DateTime.now());
final currentProvider = StateProvider<UserEntityModel?>((ref) => null);

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserEntityModel>((ref) {
  return UserNotifier();
}, dependencies: [clockProvider], name: 'User notifier provider');

final userModelProvider = Provider<UserEntityModel>((ref) {
  Map<String, dynamic> json = UserEntityModel.empty().toJson();
  return UserEntityModel.fromJson(json);
});

final userFormStateNotifierProvider =
    StateNotifierProvider<UserFormStateController, UserFormState>(
        (ref) => UserFormStateController());
