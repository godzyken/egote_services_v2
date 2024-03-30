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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
            String email, List<Professions> professions)
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
            List<Professions> professions)?
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
            List<Professions> professions)?
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
abstract class _$$ContactOwnerEntityImplCopyWith<$Res> {
  factory _$$ContactOwnerEntityImplCopyWith(_$ContactOwnerEntityImpl value,
          $Res Function(_$ContactOwnerEntityImpl) then) =
      __$$ContactOwnerEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$$ContactOwnerEntityImplCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$ContactOwnerEntityImpl>
    implements _$$ContactOwnerEntityImplCopyWith<$Res> {
  __$$ContactOwnerEntityImplCopyWithImpl(_$ContactOwnerEntityImpl _value,
      $Res Function(_$ContactOwnerEntityImpl) _then)
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
    return _then(_$ContactOwnerEntityImpl(
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
class _$ContactOwnerEntityImpl implements _ContactOwnerEntity {
  const _$ContactOwnerEntityImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$ContactOwnerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactOwnerEntityImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactOwnerEntityImpl &&
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
  _$$ContactOwnerEntityImplCopyWith<_$ContactOwnerEntityImpl> get copyWith =>
      __$$ContactOwnerEntityImplCopyWithImpl<_$ContactOwnerEntityImpl>(
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
            String email, List<Professions> professions)
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
            List<Professions> professions)?
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
            List<Professions> professions)?
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
    return _$$ContactOwnerEntityImplToJson(
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
      required final String email}) = _$ContactOwnerEntityImpl;

  factory _ContactOwnerEntity.fromJson(Map<String, dynamic> json) =
      _$ContactOwnerEntityImpl.fromJson;

  int get id;
  String get firstName;
  String get lastName;
  String get phone;
  String get email;
  @JsonKey(ignore: true)
  _$$ContactOwnerEntityImplCopyWith<_$ContactOwnerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactOwnerEntityEmptyImplCopyWith<$Res> {
  factory _$$ContactOwnerEntityEmptyImplCopyWith(
          _$ContactOwnerEntityEmptyImpl value,
          $Res Function(_$ContactOwnerEntityEmptyImpl) then) =
      __$$ContactOwnerEntityEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactOwnerEntityEmptyImplCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res,
        _$ContactOwnerEntityEmptyImpl>
    implements _$$ContactOwnerEntityEmptyImplCopyWith<$Res> {
  __$$ContactOwnerEntityEmptyImplCopyWithImpl(
      _$ContactOwnerEntityEmptyImpl _value,
      $Res Function(_$ContactOwnerEntityEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ContactOwnerEntityEmptyImpl implements _ContactOwnerEntityEmpty {
  const _$ContactOwnerEntityEmptyImpl({final String? $type})
      : $type = $type ?? 'empty';

  factory _$ContactOwnerEntityEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactOwnerEntityEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactOwnerEntityEmptyImpl);
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
            String email, List<Professions> professions)
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
            List<Professions> professions)?
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
            List<Professions> professions)?
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
    return _$$ContactOwnerEntityEmptyImplToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntityEmpty implements ContactOwnerEntity {
  const factory _ContactOwnerEntityEmpty() = _$ContactOwnerEntityEmptyImpl;

  factory _ContactOwnerEntityEmpty.fromJson(Map<String, dynamic> json) =
      _$ContactOwnerEntityEmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$ContactOwnerEntityClientImplCopyWith<$Res> {
  factory _$$ContactOwnerEntityClientImplCopyWith(
          _$ContactOwnerEntityClientImpl value,
          $Res Function(_$ContactOwnerEntityClientImpl) then) =
      __$$ContactOwnerEntityClientImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$$ContactOwnerEntityClientImplCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res,
        _$ContactOwnerEntityClientImpl>
    implements _$$ContactOwnerEntityClientImplCopyWith<$Res> {
  __$$ContactOwnerEntityClientImplCopyWithImpl(
      _$ContactOwnerEntityClientImpl _value,
      $Res Function(_$ContactOwnerEntityClientImpl) _then)
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
    return _then(_$ContactOwnerEntityClientImpl(
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
class _$ContactOwnerEntityClientImpl implements _ContactOwnerEntityClient {
  const _$ContactOwnerEntityClientImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'client';

  factory _$ContactOwnerEntityClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactOwnerEntityClientImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactOwnerEntityClientImpl &&
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
  _$$ContactOwnerEntityClientImplCopyWith<_$ContactOwnerEntityClientImpl>
      get copyWith => __$$ContactOwnerEntityClientImplCopyWithImpl<
          _$ContactOwnerEntityClientImpl>(this, _$identity);

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
            String email, List<Professions> professions)
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
            List<Professions> professions)?
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
            List<Professions> professions)?
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
    return _$$ContactOwnerEntityClientImplToJson(
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
      required final String email}) = _$ContactOwnerEntityClientImpl;

  factory _ContactOwnerEntityClient.fromJson(Map<String, dynamic> json) =
      _$ContactOwnerEntityClientImpl.fromJson;

  int get id;
  String get firstName;
  String get lastName;
  String get phone;
  String get email;
  @JsonKey(ignore: true)
  _$$ContactOwnerEntityClientImplCopyWith<_$ContactOwnerEntityClientImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactOwnerEntityProImplCopyWith<$Res> {
  factory _$$ContactOwnerEntityProImplCopyWith(
          _$ContactOwnerEntityProImpl value,
          $Res Function(_$ContactOwnerEntityProImpl) then) =
      __$$ContactOwnerEntityProImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String companyName,
      String phone,
      String email,
      List<Professions> professions});
}

/// @nodoc
class __$$ContactOwnerEntityProImplCopyWithImpl<$Res>
    extends _$ContactOwnerEntityCopyWithImpl<$Res, _$ContactOwnerEntityProImpl>
    implements _$$ContactOwnerEntityProImplCopyWith<$Res> {
  __$$ContactOwnerEntityProImplCopyWithImpl(_$ContactOwnerEntityProImpl _value,
      $Res Function(_$ContactOwnerEntityProImpl) _then)
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
    return _then(_$ContactOwnerEntityProImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      professions: null == professions
          ? _value._professions
          : professions // ignore: cast_nullable_to_non_nullable
              as List<Professions>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactOwnerEntityProImpl implements _ContactOwnerEntityPro {
  const _$ContactOwnerEntityProImpl(
      {required this.id,
      required this.companyName,
      required this.phone,
      required this.email,
      required final List<Professions> professions,
      final String? $type})
      : _professions = professions,
        $type = $type ?? 'pro';

  factory _$ContactOwnerEntityProImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactOwnerEntityProImplFromJson(json);

  @override
  final int id;
  @override
  final String companyName;
  @override
  final String phone;
  @override
  final String email;
  final List<Professions> _professions;
  @override
  List<Professions> get professions {
    if (_professions is EqualUnmodifiableListView) return _professions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_professions);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContactOwnerEntity.pro(id: $id, companyName: $companyName, phone: $phone, email: $email, professions: $professions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactOwnerEntityProImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._professions, _professions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyName, phone, email,
      const DeepCollectionEquality().hash(_professions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactOwnerEntityProImplCopyWith<_$ContactOwnerEntityProImpl>
      get copyWith => __$$ContactOwnerEntityProImplCopyWithImpl<
          _$ContactOwnerEntityProImpl>(this, _$identity);

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
            String email, List<Professions> professions)
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
            List<Professions> professions)?
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
            List<Professions> professions)?
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
    return _$$ContactOwnerEntityProImplToJson(
      this,
    );
  }
}

abstract class _ContactOwnerEntityPro implements ContactOwnerEntity {
  const factory _ContactOwnerEntityPro(
          {required final int id,
          required final String companyName,
          required final String phone,
          required final String email,
          required final List<Professions> professions}) =
      _$ContactOwnerEntityProImpl;

  factory _ContactOwnerEntityPro.fromJson(Map<String, dynamic> json) =
      _$ContactOwnerEntityProImpl.fromJson;

  int get id;
  String get companyName;
  String get phone;
  String get email;
  List<Professions> get professions;
  @JsonKey(ignore: true)
  _$$ContactOwnerEntityProImplCopyWith<_$ContactOwnerEntityProImpl>
      get copyWith => throw _privateConstructorUsedError;
}
