import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/states/user/user_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

// --- NOTIFIERS ---

class UserNotifier extends Notifier<UserEntityModel> {
  UserEntityModel? previousUser;

  @override
  UserEntityModel build() {
    final now = ref.watch(clockProvider);
    final diff = now.add(const Duration(days: 5));
    final entityModel = ref.watch(userModelProvider);

    if (diff.isAfter(entityModel.createdAt)) {
      return previousUser ?? UserEntityModel.empty();
    } else {
      return UserEntityModel.create(
        entityModel.name,
        entityModel.role,
        entityModel.isComplete,
        now,
        now,
        now,
        now,
        diff,
      );
    }
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
    previousUser = state;
  }

  void updateRole(String name) {
    state = state.copyWith(role: name);
    previousUser = state;
  }
}

class UserFormStateController extends Notifier<UserFormState> {
  @override
  UserFormState build() {
    return UserFormState(userEntityModel: UserEntityModel.empty());
  }

  FormzSubmissionStatus? isUser(UserEntityModel? userEntityModel) {
    if (userEntityModel != null && userEntityModel.name.isNotEmpty) {
      state = state.copyWith(userEntityModel: userEntityModel);
    }
    return null;
  }

  void addUser(UserEntityModel u) async {
    UserEntityModel form = state.userEntityModel.copyWith(name: u.name);

    if (form.name.isNotEmpty) {
      state = state.copyWith(userEntityModel: form);
    }
  }
}

// --- PROVIDERS ---

final clockProvider = NotifierProvider<DateTimeNotifier, DateTime>(DateTimeNotifier.new);

class DateTimeNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void refresh() {
    state = DateTime.now();
  }

  void update(DateTime newDateTime) {
    state = newDateTime;
  }

  void reset() {
    state = DateTime.now();
  }
}

final currentProvider = NotifierProvider<UserNotifier, UserEntityModel?>(
    UserNotifier.new);

final userModelProvider = Provider<UserEntityModel>((ref) {
  Map<String, dynamic> json = UserEntityModel.empty().toJson();
  return UserEntityModel.fromJson(json);
});

final userNotifierProvider =
NotifierProvider<UserNotifier, UserEntityModel>(UserNotifier.new);

final userFormStateNotifierProvider =
NotifierProvider<UserFormStateController, UserFormState>(
    UserFormStateController.new);