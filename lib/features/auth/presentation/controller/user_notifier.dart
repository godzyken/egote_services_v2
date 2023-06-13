import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/auth/presentation/states/user/user_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class UserNotifier extends StateNotifier<UserEntityModel> {
  UserNotifier([UserEntityModel? userEntityModel])
      : super(userEntityModel ?? UserEntityModel.empty());

  UserEntityModel? previousUser;

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

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
    UserEntityModel form = state.userEntityModel.copyWith(
      name: u.name
    );

    late UserEntityModel user;

    if (form.name.isNotEmpty) {
      user = form;
      state = state.copyWith(userEntityModel: user);
    }
  }
}

final clockProvider = StateProvider((ref) => DateTime.now());
final currentProvider = StateProvider<UserEntityModel?>((ref) => null);

final userNotifierProvider = StateNotifierProvider<
    UserNotifier, UserEntityModel>(
        (ref) {
          final now = ref.read(clockProvider);
          final diff = now.add(const Duration(days: 5));
          return UserNotifier(UserEntityModel(
            id: const UserId(value: 0),
            name: 'name',
            isComplete: false,
            createdAt: now,
            emailConfirmedAt: diff,
            phoneConfirmedAt: diff,
            lastSignInAt: diff,
            updatedAt: diff,
            role: 'role'
          ));
        },
  dependencies: [clockProvider],
  name: 'User notifier provider'
        );

final userFormStateNotifierProvider = StateNotifierProvider<
    UserFormStateController, UserFormState>((ref) => UserFormStateController());

