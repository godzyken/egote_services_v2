// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_owner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactOwnerEntity _$ContactOwnerEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _ContactOwnerEntity.fromJson(json);
    case 'empty':
      return _ContactOwnerEntityEmpty.fromJson(json);
    case 'client':
      return _ContactOwnerEntityClient.fromJson(json);
    case 'pro':
      return _ContactOwnerEntityPro.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ContactOwnerEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ContactOwnerEntity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)
        $default, {
    required TResult Function() empty,
    required TResult Function(int id, String firstName, String lastName,
            String phone, String email)
        client,
    required TResult Function(int id, String companyName, String phone,
            String email, Professions professions)
        pro,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult? Function()? empty,
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult? Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult Function()? empty,
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntity value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactOwnerEntityCopyWith<$Res> {
  factory $ContactOwnerEntityCopyWith(
          ContactOwnerEntity value, $Res Function(ContactOwnerEntity) then) =
      _$ContactOwnerEntityCopyWithImpl<$Res, ContactOwnerEntity>;
}

/// @nodoc
class _$ContactOwnerEntityCopyWithImpl<$Res, $Val extends ContactOwnerEntity>
    implements $ContactOwnerEntityCopyWith<$Res> {
  _$ContactOwnerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ContactOwnerEntityCopyWith<$Res> {
  factory _$$_ContactOwnerEntityCopyWith(_$_ContactOwnerEntity value,
          $Res Function(_$_ContactOwnerEntity) then) =
      __$$_ContactOwnerEntityCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$$_ContactOwnerEntityCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$_ContactOwnerEntity>
    implements _$$_ContactOwnerEntityCopyWith<$Res> {
  __$$_ContactOwnerEntityCopyWithImpl(
      _$_ContactOwnerEntity _value, $Res Function(_$_ContactOwnerEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$_ContactOwnerEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ContactOwnerEntity implements _ContactOwnerEntity {
  const _$_ContactOwnerEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$_ContactOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ContactOwnerEntityFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactOwnerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactOwnerEntityCopyWith<_$_ContactOwnerEntity> get copyWith =>
      __$$_ContactOwnerEntityCopyWithImpl<_$_ContactOwnerEntity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)
        $default, {
    required TResult Function() empty,
    required TResult Function(int id, String firstName, String lastName,
            String phone, String email)
        client,
    required TResult Function(int id, String companyName, String phone,
            String email, Professions professions)
        pro,
  }) {
    return $default(id, firstName, lastName, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult? Function()? empty,
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult? Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
  }) {
    return $default?.call(id, firstName, lastName, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult Function()? empty,
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, firstName, lastName, phone, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntity value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactOwnerEntityToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntity implements ContactOwnerEntity {
  const factory _ContactOwnerEntity(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final String email}) = _$_ContactOwnerEntity;

  factory _ContactOwnerEntity.fromJson(Map<String, dynamic> json) =
      _$_ContactOwnerEntity.fromJson;

  int get id;
  String get firstName;
  String get lastName;
  String get phone;
  String get email;
  @JsonKey(ignore: true)
  _$$_ContactOwnerEntityCopyWith<_$_ContactOwnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContactOwnerEntityEmptyCopyWith<$Res> {
  factory _$$_ContactOwnerEntityEmptyCopyWith(_$_ContactOwnerEntityEmpty value,
          $Res Function(_$_ContactOwnerEntityEmpty) then) =
      __$$_ContactOwnerEntityEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ContactOwnerEntityEmptyCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$_ContactOwnerEntityEmpty>
    implements _$$_ContactOwnerEntityEmptyCopyWith<$Res> {
  __$$_ContactOwnerEntityEmptyCopyWithImpl(_$_ContactOwnerEntityEmpty _value,
      $Res Function(_$_ContactOwnerEntityEmpty) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ContactOwnerEntityEmpty implements _ContactOwnerEntityEmpty {
  const _$_ContactOwnerEntityEmpty({final String? $type})
      : $type = $type ?? 'empty';

  factory _$_ContactOwnerEntityEmpty.fromJson(Map<String, dynamic> json) =>
      _$$_ContactOwnerEntityEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactOwnerEntityEmpty);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)
        $default, {
    required TResult Function() empty,
    required TResult Function(int id, String firstName, String lastName,
            String phone, String email)
        client,
    required TResult Function(int id, String companyName, String phone,
            String email, Professions professions)
        pro,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult? Function()? empty,
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult? Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult Function()? empty,
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntity value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactOwnerEntityEmptyToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntityEmpty implements ContactOwnerEntity {
  const factory _ContactOwnerEntityEmpty() = _$_ContactOwnerEntityEmpty;

  factory _ContactOwnerEntityEmpty.fromJson(Map<String, dynamic> json) =
      _$_ContactOwnerEntityEmpty.fromJson;
}

/// @nodoc
abstract class _$$_ContactOwnerEntityClientCopyWith<$Res> {
  factory _$$_ContactOwnerEntityClientCopyWith(
          _$_ContactOwnerEntityClient value,
          $Res Function(_$_ContactOwnerEntityClient) then) =
      __$$_ContactOwnerEntityClientCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$$_ContactOwnerEntityClientCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$_ContactOwnerEntityClient>
    implements _$$_ContactOwnerEntityClientCopyWith<$Res> {
  __$$_ContactOwnerEntityClientCopyWithImpl(_$_ContactOwnerEntityClient _value,
      $Res Function(_$_ContactOwnerEntityClient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$_ContactOwnerEntityClient(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactOwnerEntityClient implements _ContactOwnerEntityClient {
  const _$_ContactOwnerEntityClient(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'client';

  factory _$_ContactOwnerEntityClient.fromJson(Map<String, dynamic> json) =>
      _$$_ContactOwnerEntityClientFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity.client(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactOwnerEntityClient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactOwnerEntityClientCopyWith<_$_ContactOwnerEntityClient>
      get copyWith => __$$_ContactOwnerEntityClientCopyWithImpl<
          _$_ContactOwnerEntityClient>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)
        $default, {
    required TResult Function() empty,
    required TResult Function(int id, String firstName, String lastName,
            String phone, String email)
        client,
    required TResult Function(int id, String companyName, String phone,
            String email, Professions professions)
        pro,
  }) {
    return client(id, firstName, lastName, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult? Function()? empty,
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult? Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
  }) {
    return client?.call(id, firstName, lastName, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult Function()? empty,
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(id, firstName, lastName, phone, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) {
    return client(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntity value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) {
    return client?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactOwnerEntityClientToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntityClient implements ContactOwnerEntity {
  const factory _ContactOwnerEntityClient(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final String email}) = _$_ContactOwnerEntityClient;

  factory _ContactOwnerEntityClient.fromJson(Map<String, dynamic> json) =
      _$_ContactOwnerEntityClient.fromJson;

  int get id;
  String get firstName;
  String get lastName;
  String get phone;
  String get email;
  @JsonKey(ignore: true)
  _$$_ContactOwnerEntityClientCopyWith<_$_ContactOwnerEntityClient>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContactOwnerEntityProCopyWith<$Res> {
  factory _$$_ContactOwnerEntityProCopyWith(_$_ContactOwnerEntityPro value,
          $Res Function(_$_ContactOwnerEntityPro) then) =
      __$$_ContactOwnerEntityProCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String companyName,
      String phone,
      String email,
      Professions professions});
}

/// @nodoc
class __$$_ContactOwnerEntityProCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$_ContactOwnerEntityPro>
    implements _$$_ContactOwnerEntityProCopyWith<$Res> {
  __$$_ContactOwnerEntityProCopyWithImpl(_$_ContactOwnerEntityPro _value,
      $Res Function(_$_ContactOwnerEntityPro) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyName = null,
    Object? phone = null,
    Object? email = null,
    Object? professions = null,
  }) {
    return _then(_$_ContactOwnerEntityPro(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == professions
          ? _value.professions
          : professions // ignore: cast_nullable_to_non_nullable
              as Professions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactOwnerEntityPro implements _ContactOwnerEntityPro {
  const _$_ContactOwnerEntityPro(
      this.id, this.companyName, this.phone, this.email, this.professions,
      {final String? $type})
      : $type = $type ?? 'pro';

  factory _$_ContactOwnerEntityPro.fromJson(Map<String, dynamic> json) =>
      _$$_ContactOwnerEntityProFromJson(json);

  @override
  final int id;
  @override
  final String companyName;
  @override
  final String phone;
  @override
  final String email;
  @override
  final Professions professions;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity.pro(id: $id, companyName: $companyName, phone: $phone, email: $email, professions: $professions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactOwnerEntityPro &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.professions, professions) ||
                other.professions == professions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, companyName, phone, email, professions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactOwnerEntityProCopyWith<_$_ContactOwnerEntityPro> get copyWith =>
      __$$_ContactOwnerEntityProCopyWithImpl<_$_ContactOwnerEntityPro>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)
        $default, {
    required TResult Function() empty,
    required TResult Function(int id, String firstName, String lastName,
            String phone, String email)
        client,
    required TResult Function(int id, String companyName, String phone,
            String email, Professions professions)
        pro,
  }) {
    return pro(id, companyName, phone, email, professions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult? Function()? empty,
    TResult? Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult? Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
  }) {
    return pro?.call(id, companyName, phone, email, professions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        $default, {
    TResult Function()? empty,
    TResult Function(int id, String firstName, String lastName, String phone,
            String email)?
        client,
    TResult Function(int id, String companyName, String phone, String email,
            Professions professions)?
        pro,
    required TResult orElse(),
  }) {
    if (pro != null) {
      return pro(id, companyName, phone, email, professions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) {
    return pro(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntity value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) {
    return pro?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntity value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) {
    if (pro != null) {
      return pro(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactOwnerEntityProToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntityPro implements ContactOwnerEntity {
  const factory _ContactOwnerEntityPro(
      final int id,
      final String companyName,
      final String phone,
      final String email,
      final Professions professions) = _$_ContactOwnerEntityPro;

  factory _ContactOwnerEntityPro.fromJson(Map<String, dynamic> json) =
      _$_ContactOwnerEntityPro.fromJson;

  int get id;
  String get companyName;
  String get phone;
  String get email;
  Professions get professions;
  @JsonKey(ignore: true)
  _$$_ContactOwnerEntityProCopyWith<_$_ContactOwnerEntityPro> get copyWith =>
      throw _privateConstructorUsedError;
}
