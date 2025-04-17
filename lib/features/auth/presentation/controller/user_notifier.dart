import 'dart:io';

import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/states/user/user_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/user_properties/name.dart';
import '../../domain/entities/user_properties/role.dart';

class UserNotifier extends StateNotifier<UserEntityModel> {
  UserNotifier([UserEntityModel? userEntityModel])
      : super(userEntityModel ?? UserEntityModel.empty());

  final List<UserEntityModel> _previousStates = [];

  void updateName(String name) {
    if (name.isEmpty) {
      throw Exception('Name cannot be empty');
    }
    _savePreviousState();
    state = state.copyWith(name: name);
  }

  void updateRole(String role) {
    if (role.isEmpty) {
      throw Exception('Role cannot be empty');
    }
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
    if (name == null && role == null) {
      throw Exception('At least one field must be updated');
    }

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
      state = _previousStates.removeLast().copyWith();
    }
  }

  List<UserEntityModel> get previousStates => _previousStates;
}

class UserFormStateController extends StateNotifier<UserFormState> {
  UserFormStateController() : super(UserFormState(UserEntityModel.empty()));

  FormzSubmissionStatus? isUser(UserEntityModel? userEntityModel) {
    if (userEntityModel!.name.isEmpty) {
      return FormzSubmissionStatus.failure;
    }
    state = state.copyWith(userEntityModel: userEntityModel);
    return FormzSubmissionStatus.success;
  }

  // Méthode pour ajouter ou mettre à jour l'utilisateur
  Future<void> addUser(UserEntityModel user) async {
    // Commencer avec un état de "en cours" pour indiquer que la soumission est en cours
    state = state.copyWith(
      nameFormz: NameFormz.dirty(user.name),
      roleFormz: RoleFormz.dirty(user.role),
    );

    // Validation des champs avant mise à jour
    if (user.name.isEmpty || user.role.isEmpty || user.phone.isEmpty) {
      // Si l'un des champs est invalide, on met à jour l'état avec un statut d'échec
      state = state.copyWith(status: FormzSubmissionStatus.failure);
      return;
    }

    try {
      // Simuler un délai d'attente (par exemple, appel réseau)
      await Future.delayed(const Duration(seconds: 2));

      // Mise à jour de l'état avec un statut de réussite et l'utilisateur mis à jour
      state = state.copyWith(
        userEntityModel: user,
        status: FormzSubmissionStatus.success,
      );
    } catch (e) {
      // En cas d'erreur, mettez à jour l'état avec un message d'erreur
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  // Méthode pour réinitialiser l'état du formulaire
  void resetForm() {
    state = UserFormState(UserEntityModel.empty());
  }

// Méthode pour ajouter un utilisateur
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

class AvatarNotifier extends StateNotifier<File?> {
  AvatarNotifier() : super(null);

  void updateAvatar(File? avatar) {
    state = avatar;
  }

  void resetAvatar() {
    state = null;
  }
}

final avatarNotifierProvider =
    StateNotifierProvider<AvatarNotifier, File?>((ref) => AvatarNotifier());
