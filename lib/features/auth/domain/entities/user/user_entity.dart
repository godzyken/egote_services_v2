import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/adapter/user/user_converter.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';



part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

var _uuid = const Uuid();

@freezed
abstract class UserEntityModel with _$UserEntityModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserEntityModel({
    required UserId id,
    required String name,
    required String role,
    required bool isComplete,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? emailConfirmedAt,
    required DateTime? phoneConfirmedAt,
    required DateTime? lastSignInAt,
  }) = _UserEntityModel;

  const UserEntityModel._();

  UserEntityModel complete() => copyWith(isComplete: true);

  UserEntityModel uncomplete() => copyWith(isComplete: false);

  factory UserEntityModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>? ?? {};

    // Helper pour parser les dates Firestore (Timestamp) ou ISO-String
    DateTime parseDateTime(dynamic value) {
      if (value is Timestamp) return value.toDate();
      if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
      return DateTime.now();
    }

    DateTime? parseOptionalDateTime(dynamic value) {
      if (value is Timestamp) return value.toDate();
      if (value is String) return DateTime.tryParse(value);
      return null;
    }

    return UserEntityModel(
      id: UserId(value: int.tryParse(doc.id) ?? 0),
      name: map['name'] as String? ?? '',
      role: map['role'] as String? ?? '',
      isComplete: map['is_complete'] as bool? ?? false,
      createdAt: parseDateTime(map['created_at']),
      updatedAt: parseDateTime(map['updated_at']),
      emailConfirmedAt: parseOptionalDateTime(map['email_confirmed_at']),
      phoneConfirmedAt: parseOptionalDateTime(map['phone_confirmed_at']),
      lastSignInAt: parseOptionalDateTime(map['last_sign_in_at']),
    );
  }

  factory UserEntityModel.create(
      String name,
      String role,
      bool isComplete,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? emailConfirmedAt,
      DateTime? phoneConfirmedAt,
      DateTime? lastSignInAt,
      ) {
    // Génération d'un entier unique à partir des millisecondes ou du hash UUID
    final intId = DateTime.now().millisecondsSinceEpoch;

    return UserEntityModel(
      id: UserId(value: intId),
      name: name,
      role: role,
      isComplete: isComplete,
      createdAt: createdAt,
      updatedAt: updatedAt,
      emailConfirmedAt: emailConfirmedAt,
      phoneConfirmedAt: phoneConfirmedAt,
      lastSignInAt: lastSignInAt,
    );
  }

  factory UserEntityModel.empty() => UserEntityModel(
    id: const UserId(value: 0),
    name: '',
    role: '',
    isComplete: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    emailConfirmedAt: null,
    phoneConfirmedAt: null,
    lastSignInAt: null,
  );

  factory UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);
}

@freezed
abstract class Users with _$Users {
  const factory Users.data(
      UserList userList,
      ) = UsersData;

  const factory Users.loading() = UsersLoading;

  const factory Users.error(Object error, StackTrace stackTrace) = UsersError;

  const Users._();
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel.complete({
    required UserId id,
    required UserEntityModel userEntityModel,
    @UserConverter() required AuthUser authUser,
    @JsonKey(includeFromJson: false, includeToJson: false)
    CubeUser? cubeUser,
  }) = _UserModelComplete;

  const factory UserModel.unComplete({
    required UserId id,
    required UserEntityModel userEntityModel,
    @UserConverter() required AuthUser authUser,
  }) = _UserModelUnComplete;

  const UserModel._();

  factory UserModel.create({
    required UserId id,
    required String email,
    required String name,
  }) {
    // Mocked for tests
    return UserModel.unComplete(
      id: id,
      userEntityModel: UserEntityModel.create(
        name,
        'user',
        false,
        DateTime.now(),
        DateTime.now(),
        null,
        null,
        null,
      ),
      authUser: AuthUser(
        id: id.value.toString(),
        appMetadata: {},
        userMetadata: {'name': name},
        aud: '',
        createdAt: DateTime.now().toIso8601String(),
        email: email,
        phone: '',
        role: 'authenticated',
        updatedAt: DateTime.now().toIso8601String(),
      ),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}