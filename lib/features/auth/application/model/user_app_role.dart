import 'package:egote_services_v2/features/auth/application/wrapper/adapter/app_user.dart';

UserLevel parseUserRole(dynamic role) {
  if (role is String) {
    switch (role.toLowerCase()) {
      case 'admin':
        return UserLevel.admin;
      case 'support':
        return UserLevel.support;
      case 'user':
        return UserLevel.user;
      case 'guest':
        return UserLevel.guest;
      default:
        return UserLevel.guest;
    }
  }
  return UserLevel.guest;
}
