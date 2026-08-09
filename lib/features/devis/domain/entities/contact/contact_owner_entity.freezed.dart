// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_owner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ContactOwnerEntity _$ContactOwnerEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _ContactOwnerEntityDefault.fromJson(json);
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
  /// Serializes this ContactOwnerEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ContactOwnerEntity);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ContactOwnerEntity()';
  }
}

/// @nodoc
class $ContactOwnerEntityCopyWith<$Res> {
  $ContactOwnerEntityCopyWith(
      ContactOwnerEntity _, $Res Function(ContactOwnerEntity) __);
}

/// Adds pattern-matching-related methods to [ContactOwnerEntity].
extension ContactOwnerEntityPatterns on ContactOwnerEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContactOwnerEntityDefault value)? $default, {
    TResult Function(_ContactOwnerEntityEmpty value)? empty,
    TResult Function(_ContactOwnerEntityClient value)? client,
    TResult Function(_ContactOwnerEntityPro value)? pro,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault() when $default != null:
        return $default(_that);
      case _ContactOwnerEntityEmpty() when empty != null:
        return empty(_that);
      case _ContactOwnerEntityClient() when client != null:
        return client(_that);
      case _ContactOwnerEntityPro() when pro != null:
        return pro(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContactOwnerEntityDefault value) $default, {
    required TResult Function(_ContactOwnerEntityEmpty value) empty,
    required TResult Function(_ContactOwnerEntityClient value) client,
    required TResult Function(_ContactOwnerEntityPro value) pro,
  }) {
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault():
        return $default(_that);
      case _ContactOwnerEntityEmpty():
        return empty(_that);
      case _ContactOwnerEntityClient():
        return client(_that);
      case _ContactOwnerEntityPro():
        return pro(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContactOwnerEntityDefault value)? $default, {
    TResult? Function(_ContactOwnerEntityEmpty value)? empty,
    TResult? Function(_ContactOwnerEntityClient value)? client,
    TResult? Function(_ContactOwnerEntityPro value)? pro,
  }) {
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault() when $default != null:
        return $default(_that);
      case _ContactOwnerEntityEmpty() when empty != null:
        return empty(_that);
      case _ContactOwnerEntityClient() when client != null:
        return client(_that);
      case _ContactOwnerEntityPro() when pro != null:
        return pro(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityEmpty() when empty != null:
        return empty();
      case _ContactOwnerEntityClient() when client != null:
        return client(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityPro() when pro != null:
        return pro(_that.id, _that.companyName, _that.phone, _that.email,
            _that.professions);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault():
        return $default(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityEmpty():
        return empty();
      case _ContactOwnerEntityClient():
        return client(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityPro():
        return pro(_that.id, _that.companyName, _that.phone, _that.email,
            _that.professions);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _ContactOwnerEntityDefault() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityEmpty() when empty != null:
        return empty();
      case _ContactOwnerEntityClient() when client != null:
        return client(_that.id, _that.firstName, _that.lastName, _that.phone,
            _that.email);
      case _ContactOwnerEntityPro() when pro != null:
        return pro(_that.id, _that.companyName, _that.phone, _that.email,
            _that.professions);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _ContactOwnerEntityDefault implements ContactOwnerEntity {
  const _ContactOwnerEntityDefault(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'default';
  factory _ContactOwnerEntityDefault.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityDefaultFromJson(json);

  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactOwnerEntityDefaultCopyWith<_ContactOwnerEntityDefault>
      get copyWith =>
          __$ContactOwnerEntityDefaultCopyWithImpl<_ContactOwnerEntityDefault>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactOwnerEntityDefaultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactOwnerEntityDefault &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, phone, email);

  @override
  String toString() {
    return 'ContactOwnerEntity(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ContactOwnerEntityDefaultCopyWith<$Res>
    implements $ContactOwnerEntityCopyWith<$Res> {
  factory _$ContactOwnerEntityDefaultCopyWith(_ContactOwnerEntityDefault value,
          $Res Function(_ContactOwnerEntityDefault) _then) =
      __$ContactOwnerEntityDefaultCopyWithImpl;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$ContactOwnerEntityDefaultCopyWithImpl<$Res>
    implements _$ContactOwnerEntityDefaultCopyWith<$Res> {
  __$ContactOwnerEntityDefaultCopyWithImpl(this._self, this._then);

  final _ContactOwnerEntityDefault _self;
  final $Res Function(_ContactOwnerEntityDefault) _then;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_ContactOwnerEntityDefault(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ContactOwnerEntityEmpty implements ContactOwnerEntity {
  const _ContactOwnerEntityEmpty({final String? $type})
      : $type = $type ?? 'empty';
  factory _ContactOwnerEntityEmpty.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ContactOwnerEntityEmptyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ContactOwnerEntityEmpty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ContactOwnerEntity.empty()';
  }
}

/// @nodoc
@JsonSerializable()
class _ContactOwnerEntityClient implements ContactOwnerEntity {
  const _ContactOwnerEntityClient(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      final String? $type})
      : $type = $type ?? 'client';
  factory _ContactOwnerEntityClient.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityClientFromJson(json);

  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactOwnerEntityClientCopyWith<_ContactOwnerEntityClient> get copyWith =>
      __$ContactOwnerEntityClientCopyWithImpl<_ContactOwnerEntityClient>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactOwnerEntityClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactOwnerEntityClient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, phone, email);

  @override
  String toString() {
    return 'ContactOwnerEntity.client(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ContactOwnerEntityClientCopyWith<$Res>
    implements $ContactOwnerEntityCopyWith<$Res> {
  factory _$ContactOwnerEntityClientCopyWith(_ContactOwnerEntityClient value,
          $Res Function(_ContactOwnerEntityClient) _then) =
      __$ContactOwnerEntityClientCopyWithImpl;
  @useResult
  $Res call(
      {int id, String firstName, String lastName, String phone, String email});
}

/// @nodoc
class __$ContactOwnerEntityClientCopyWithImpl<$Res>
    implements _$ContactOwnerEntityClientCopyWith<$Res> {
  __$ContactOwnerEntityClientCopyWithImpl(this._self, this._then);

  final _ContactOwnerEntityClient _self;
  final $Res Function(_ContactOwnerEntityClient) _then;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_ContactOwnerEntityClient(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ContactOwnerEntityPro implements ContactOwnerEntity {
  const _ContactOwnerEntityPro(
      {required this.id,
      required this.companyName,
      required this.phone,
      required this.email,
      required final List<Professions> professions,
      final String? $type})
      : _professions = professions,
        $type = $type ?? 'pro';
  factory _ContactOwnerEntityPro.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityProFromJson(json);

  final int id;
  final String companyName;
  final String phone;
  final String email;
  final List<Professions> _professions;
  List<Professions> get professions {
    if (_professions is EqualUnmodifiableListView) return _professions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_professions);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactOwnerEntityProCopyWith<_ContactOwnerEntityPro> get copyWith =>
      __$ContactOwnerEntityProCopyWithImpl<_ContactOwnerEntityPro>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactOwnerEntityProToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactOwnerEntityPro &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._professions, _professions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyName, phone, email,
      const DeepCollectionEquality().hash(_professions));

  @override
  String toString() {
    return 'ContactOwnerEntity.pro(id: $id, companyName: $companyName, phone: $phone, email: $email, professions: $professions)';
  }
}

/// @nodoc
abstract mixin class _$ContactOwnerEntityProCopyWith<$Res>
    implements $ContactOwnerEntityCopyWith<$Res> {
  factory _$ContactOwnerEntityProCopyWith(_ContactOwnerEntityPro value,
          $Res Function(_ContactOwnerEntityPro) _then) =
      __$ContactOwnerEntityProCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String companyName,
      String phone,
      String email,
      List<Professions> professions});
}

/// @nodoc
class __$ContactOwnerEntityProCopyWithImpl<$Res>
    implements _$ContactOwnerEntityProCopyWith<$Res> {
  __$ContactOwnerEntityProCopyWithImpl(this._self, this._then);

  final _ContactOwnerEntityPro _self;
  final $Res Function(_ContactOwnerEntityPro) _then;

  /// Create a copy of ContactOwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? companyName = null,
    Object? phone = null,
    Object? email = null,
    Object? professions = null,
  }) {
    return _then(_ContactOwnerEntityPro(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      professions: null == professions
          ? _self._professions
          : professions // ignore: cast_nullable_to_non_nullable
              as List<Professions>,
    ));
  }
}

// dart format on
