
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/views/models/userlist/user_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFormViewModel {
  late UserId _id;
  final UserListViewModel _userListViewModel;
  var _name = '';
  var _role = '';
  var _isComplete = false;
  var _createdAt = DateTime.now();
  var _updatedAt = DateTime.now();
  var _emailConfirmedAt = DateTime.now();
  var _phoneConfirmedAt = DateTime.now();
  var _lastSignInAt = DateTime.now();
  var _isNewUser = false;


  AddFormViewModel(
      final UserEntityModel? userEntityModel,
      this._userListViewModel) {
    _initUser(userEntityModel);
  }

  _initUser(final UserEntityModel? userEntityModel) {
    if (userEntityModel == null) {
      _isNewUser = true;
    } else {
      _id = userEntityModel.id;
      _name = userEntityModel.name;
      _role = userEntityModel.role;
      _isComplete = userEntityModel.isComplete;
      _createdAt = userEntityModel.createdAt;
    }
  }

  createOrUpdate() {
    if (_isNewUser) {
      _userListViewModel.createUser(
          _name,
          _role,
          _isComplete,
          _createdAt,
          _updatedAt,
          _emailConfirmedAt,
          _phoneConfirmedAt,
          _lastSignInAt
      );
    } else {
      final newUser = UserEntityModel.create(
          _name,
          _role,
          _isComplete,
          _createdAt,
          _updatedAt,
          _emailConfirmedAt,
          _phoneConfirmedAt,
          _lastSignInAt
      );
      _userListViewModel.updateEntityUser(newUser);
    }
  }

  deleteUser() {
    if (!_isNewUser) _userListViewModel.deleteUser(_id);
  }

  String appBarTitle() => _isNewUser ? 'Create User' : 'Edit User';
  String initialTitleValue() => _name;
  String initialRoleValue() => _role;
  bool shouldShowDeleteUserIcon() => !_isNewUser;
  DateTime initialCreateValue() => _createdAt;
  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);
  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);
  DateTime initialUpdateValue() => _updatedAt;
  DateTime initialEmailConfirmedAtValue() => _emailConfirmedAt;
  DateTime initialPhoneConfirmedAtValue() => _phoneConfirmedAt;
  DateTime initialLastSignInAtValue() => _lastSignInAt;

  setTitle(final String value) => _name = value;
  setRole(final String value) => _role = value;
  setUserStatus(final bool status) => _isComplete = status;
  setCreate(final DateTime value) => _createdAt = value;
  setUpdate(final DateTime value) => _updatedAt = value;
  setEmailConfirmedAt(final DateTime value) => _emailConfirmedAt = value;
  setPhoneConfirmedAt(final DateTime value) => _phoneConfirmedAt = value;
  setLastSignInAT(final DateTime value) => _lastSignInAt = value;

  String? validateName() {
    if (_name.isEmpty) {
      return 'Enter a title.';
    } else if (_name.length > 20) {
      return 'Limit the title to 20 characters.';
    } else {
      return null;
    }
  }

  String? validateRole() {
    if (_role.length > 100) {
      return 'Limit the description to 100 characters.';
    } else {
      return null;
    }
  }

  String? validateDueDate() {
    if (_isNewUser && _createdAt.isBefore(DateTime.now())) {
      return "DueDate must be after today's date.";
    } else {
      return null;
    }
  }
}

final addFormViewModelProvider = Provider
    .autoDispose
    .family<AddFormViewModel, UserEntityModel?>(
        (ref, user) {
          final userListViewModel = ref.watch(userListViewModelStateNotifierProvider.notifier);
          return AddFormViewModel(user, userListViewModel);
        });