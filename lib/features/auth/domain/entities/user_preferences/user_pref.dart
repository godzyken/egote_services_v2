import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pref.freezed.dart';

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required UserEntityModel userEntityModel,
    required ThemeMode themeMode,
    required String about,
    required bool isDarkMode
  }) = _UserPreferences;

}