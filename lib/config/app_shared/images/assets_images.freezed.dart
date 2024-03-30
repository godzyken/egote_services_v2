// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Images _$ImagesFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'web':
      return _ImagesWeb.fromJson(json);
    case 'local':
      return _ImagesLocal.fromJson(json);
    case 'error':
      return _ImagesError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Images',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Images {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) web,
    required TResult Function(@AssetsImageConverter() List<LocalImages> images)
        local,
    required TResult Function(String error, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? web,
    TResult? Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult? Function(String error, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? web,
    TResult Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult Function(String error, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesWeb value) web,
    required TResult Function(_ImagesLocal value) local,
    required TResult Function(_ImagesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesWeb value)? web,
    TResult? Function(_ImagesLocal value)? local,
    TResult? Function(_ImagesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesWeb value)? web,
    TResult Function(_ImagesLocal value)? local,
    TResult Function(_ImagesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImagesWebImplCopyWith<$Res> {
  factory _$$ImagesWebImplCopyWith(
          _$ImagesWebImpl value, $Res Function(_$ImagesWebImpl) then) =
      __$$ImagesWebImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ImagesWebImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesWebImpl>
    implements _$$ImagesWebImplCopyWith<$Res> {
  __$$ImagesWebImplCopyWithImpl(
      _$ImagesWebImpl _value, $Res Function(_$ImagesWebImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ImagesWebImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesWebImpl implements _ImagesWeb {
  const _$ImagesWebImpl({required this.name, final String? $type})
      : $type = $type ?? 'web';

  factory _$ImagesWebImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesWebImplFromJson(json);

  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Images.web(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesWebImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesWebImplCopyWith<_$ImagesWebImpl> get copyWith =>
      __$$ImagesWebImplCopyWithImpl<_$ImagesWebImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) web,
    required TResult Function(@AssetsImageConverter() List<LocalImages> images)
        local,
    required TResult Function(String error, String message) error,
  }) {
    return web(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? web,
    TResult? Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult? Function(String error, String message)? error,
  }) {
    return web?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? web,
    TResult Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult Function(String error, String message)? error,
    required TResult orElse(),
  }) {
    if (web != null) {
      return web(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesWeb value) web,
    required TResult Function(_ImagesLocal value) local,
    required TResult Function(_ImagesError value) error,
  }) {
    return web(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesWeb value)? web,
    TResult? Function(_ImagesLocal value)? local,
    TResult? Function(_ImagesError value)? error,
  }) {
    return web?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesWeb value)? web,
    TResult Function(_ImagesLocal value)? local,
    TResult Function(_ImagesError value)? error,
    required TResult orElse(),
  }) {
    if (web != null) {
      return web(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesWebImplToJson(
      this,
    );
  }
}

abstract class _ImagesWeb implements Images {
  const factory _ImagesWeb({required final String name}) = _$ImagesWebImpl;

  factory _ImagesWeb.fromJson(Map<String, dynamic> json) =
      _$ImagesWebImpl.fromJson;

  String get name;
  @JsonKey(ignore: true)
  _$$ImagesWebImplCopyWith<_$ImagesWebImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagesLocalImplCopyWith<$Res> {
  factory _$$ImagesLocalImplCopyWith(
          _$ImagesLocalImpl value, $Res Function(_$ImagesLocalImpl) then) =
      __$$ImagesLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@AssetsImageConverter() List<LocalImages> images});
}

/// @nodoc
class __$$ImagesLocalImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesLocalImpl>
    implements _$$ImagesLocalImplCopyWith<$Res> {
  __$$ImagesLocalImplCopyWithImpl(
      _$ImagesLocalImpl _value, $Res Function(_$ImagesLocalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$ImagesLocalImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<LocalImages>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesLocalImpl implements _ImagesLocal {
  const _$ImagesLocalImpl(
      {@AssetsImageConverter() required final List<LocalImages> images,
      final String? $type})
      : _images = images,
        $type = $type ?? 'local';

  factory _$ImagesLocalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesLocalImplFromJson(json);

  final List<LocalImages> _images;
  @override
  @AssetsImageConverter()
  List<LocalImages> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Images.local(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesLocalImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesLocalImplCopyWith<_$ImagesLocalImpl> get copyWith =>
      __$$ImagesLocalImplCopyWithImpl<_$ImagesLocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) web,
    required TResult Function(@AssetsImageConverter() List<LocalImages> images)
        local,
    required TResult Function(String error, String message) error,
  }) {
    return local(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? web,
    TResult? Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult? Function(String error, String message)? error,
  }) {
    return local?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? web,
    TResult Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult Function(String error, String message)? error,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesWeb value) web,
    required TResult Function(_ImagesLocal value) local,
    required TResult Function(_ImagesError value) error,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesWeb value)? web,
    TResult? Function(_ImagesLocal value)? local,
    TResult? Function(_ImagesError value)? error,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesWeb value)? web,
    TResult Function(_ImagesLocal value)? local,
    TResult Function(_ImagesError value)? error,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesLocalImplToJson(
      this,
    );
  }
}

abstract class _ImagesLocal implements Images {
  const factory _ImagesLocal(
          {@AssetsImageConverter() required final List<LocalImages> images}) =
      _$ImagesLocalImpl;

  factory _ImagesLocal.fromJson(Map<String, dynamic> json) =
      _$ImagesLocalImpl.fromJson;

  @AssetsImageConverter()
  List<LocalImages> get images;
  @JsonKey(ignore: true)
  _$$ImagesLocalImplCopyWith<_$ImagesLocalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagesErrorImplCopyWith<$Res> {
  factory _$$ImagesErrorImplCopyWith(
          _$ImagesErrorImpl value, $Res Function(_$ImagesErrorImpl) then) =
      __$$ImagesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String message});
}

/// @nodoc
class __$$ImagesErrorImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesErrorImpl>
    implements _$$ImagesErrorImplCopyWith<$Res> {
  __$$ImagesErrorImplCopyWithImpl(
      _$ImagesErrorImpl _value, $Res Function(_$ImagesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_$ImagesErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesErrorImpl implements _ImagesError {
  const _$ImagesErrorImpl(
      {required this.error, required this.message, final String? $type})
      : $type = $type ?? 'error';

  factory _$ImagesErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesErrorImplFromJson(json);

  @override
  final String error;
  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Images.error(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesErrorImplCopyWith<_$ImagesErrorImpl> get copyWith =>
      __$$ImagesErrorImplCopyWithImpl<_$ImagesErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) web,
    required TResult Function(@AssetsImageConverter() List<LocalImages> images)
        local,
    required TResult Function(String error, String message) error,
  }) {
    return error(this.error, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? web,
    TResult? Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult? Function(String error, String message)? error,
  }) {
    return error?.call(this.error, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? web,
    TResult Function(@AssetsImageConverter() List<LocalImages> images)? local,
    TResult Function(String error, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesWeb value) web,
    required TResult Function(_ImagesLocal value) local,
    required TResult Function(_ImagesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesWeb value)? web,
    TResult? Function(_ImagesLocal value)? local,
    TResult? Function(_ImagesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesWeb value)? web,
    TResult Function(_ImagesLocal value)? local,
    TResult Function(_ImagesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesErrorImplToJson(
      this,
    );
  }
}

abstract class _ImagesError implements Images {
  const factory _ImagesError(
      {required final String error,
      required final String message}) = _$ImagesErrorImpl;

  factory _ImagesError.fromJson(Map<String, dynamic> json) =
      _$ImagesErrorImpl.fromJson;

  String get error;
  String get message;
  @JsonKey(ignore: true)
  _$$ImagesErrorImplCopyWith<_$ImagesErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImagesAssets _$ImagesAssetsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return _ImagesAssetsLoading.fromJson(json);
    case 'failed':
      return _ImagesAssetsFailed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ImagesAssets',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ImagesAssets {
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Images> images, bool isLoading) loading,
    required TResult Function(bool isLoading, String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Images> images, bool isLoading)? loading,
    TResult? Function(bool isLoading, String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Images> images, bool isLoading)? loading,
    TResult Function(bool isLoading, String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesAssetsLoading value) loading,
    required TResult Function(_ImagesAssetsFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesAssetsLoading value)? loading,
    TResult? Function(_ImagesAssetsFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesAssetsLoading value)? loading,
    TResult Function(_ImagesAssetsFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesAssetsCopyWith<ImagesAssets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesAssetsCopyWith<$Res> {
  factory $ImagesAssetsCopyWith(
          ImagesAssets value, $Res Function(ImagesAssets) then) =
      _$ImagesAssetsCopyWithImpl<$Res, ImagesAssets>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ImagesAssetsCopyWithImpl<$Res, $Val extends ImagesAssets>
    implements $ImagesAssetsCopyWith<$Res> {
  _$ImagesAssetsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesAssetsLoadingImplCopyWith<$Res>
    implements $ImagesAssetsCopyWith<$Res> {
  factory _$$ImagesAssetsLoadingImplCopyWith(_$ImagesAssetsLoadingImpl value,
          $Res Function(_$ImagesAssetsLoadingImpl) then) =
      __$$ImagesAssetsLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Images> images, bool isLoading});
}

/// @nodoc
class __$$ImagesAssetsLoadingImplCopyWithImpl<$Res>
    extends _$ImagesAssetsCopyWithImpl<$Res, _$ImagesAssetsLoadingImpl>
    implements _$$ImagesAssetsLoadingImplCopyWith<$Res> {
  __$$ImagesAssetsLoadingImplCopyWithImpl(_$ImagesAssetsLoadingImpl _value,
      $Res Function(_$ImagesAssetsLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isLoading = null,
  }) {
    return _then(_$ImagesAssetsLoadingImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesAssetsLoadingImpl extends _ImagesAssetsLoading {
  const _$ImagesAssetsLoadingImpl(
      {required final List<Images> images,
      required this.isLoading,
      final String? $type})
      : _images = images,
        $type = $type ?? 'loading',
        super._();

  factory _$ImagesAssetsLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesAssetsLoadingImplFromJson(json);

  final List<Images> _images;
  @override
  List<Images> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final bool isLoading;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImagesAssets.loading(images: $images, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesAssetsLoadingImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_images), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesAssetsLoadingImplCopyWith<_$ImagesAssetsLoadingImpl> get copyWith =>
      __$$ImagesAssetsLoadingImplCopyWithImpl<_$ImagesAssetsLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Images> images, bool isLoading) loading,
    required TResult Function(bool isLoading, String message) failed,
  }) {
    return loading(images, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Images> images, bool isLoading)? loading,
    TResult? Function(bool isLoading, String message)? failed,
  }) {
    return loading?.call(images, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Images> images, bool isLoading)? loading,
    TResult Function(bool isLoading, String message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(images, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesAssetsLoading value) loading,
    required TResult Function(_ImagesAssetsFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesAssetsLoading value)? loading,
    TResult? Function(_ImagesAssetsFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesAssetsLoading value)? loading,
    TResult Function(_ImagesAssetsFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesAssetsLoadingImplToJson(
      this,
    );
  }
}

abstract class _ImagesAssetsLoading extends ImagesAssets {
  const factory _ImagesAssetsLoading(
      {required final List<Images> images,
      required final bool isLoading}) = _$ImagesAssetsLoadingImpl;
  const _ImagesAssetsLoading._() : super._();

  factory _ImagesAssetsLoading.fromJson(Map<String, dynamic> json) =
      _$ImagesAssetsLoadingImpl.fromJson;

  List<Images> get images;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ImagesAssetsLoadingImplCopyWith<_$ImagesAssetsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagesAssetsFailedImplCopyWith<$Res>
    implements $ImagesAssetsCopyWith<$Res> {
  factory _$$ImagesAssetsFailedImplCopyWith(_$ImagesAssetsFailedImpl value,
          $Res Function(_$ImagesAssetsFailedImpl) then) =
      __$$ImagesAssetsFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String message});
}

/// @nodoc
class __$$ImagesAssetsFailedImplCopyWithImpl<$Res>
    extends _$ImagesAssetsCopyWithImpl<$Res, _$ImagesAssetsFailedImpl>
    implements _$$ImagesAssetsFailedImplCopyWith<$Res> {
  __$$ImagesAssetsFailedImplCopyWithImpl(_$ImagesAssetsFailedImpl _value,
      $Res Function(_$ImagesAssetsFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? message = null,
  }) {
    return _then(_$ImagesAssetsFailedImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesAssetsFailedImpl extends _ImagesAssetsFailed {
  const _$ImagesAssetsFailedImpl(
      {required this.isLoading, required this.message, final String? $type})
      : $type = $type ?? 'failed',
        super._();

  factory _$ImagesAssetsFailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesAssetsFailedImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImagesAssets.failed(isLoading: $isLoading, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesAssetsFailedImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesAssetsFailedImplCopyWith<_$ImagesAssetsFailedImpl> get copyWith =>
      __$$ImagesAssetsFailedImplCopyWithImpl<_$ImagesAssetsFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Images> images, bool isLoading) loading,
    required TResult Function(bool isLoading, String message) failed,
  }) {
    return failed(isLoading, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Images> images, bool isLoading)? loading,
    TResult? Function(bool isLoading, String message)? failed,
  }) {
    return failed?.call(isLoading, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Images> images, bool isLoading)? loading,
    TResult Function(bool isLoading, String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(isLoading, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagesAssetsLoading value) loading,
    required TResult Function(_ImagesAssetsFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagesAssetsLoading value)? loading,
    TResult? Function(_ImagesAssetsFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagesAssetsLoading value)? loading,
    TResult Function(_ImagesAssetsFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesAssetsFailedImplToJson(
      this,
    );
  }
}

abstract class _ImagesAssetsFailed extends ImagesAssets {
  const factory _ImagesAssetsFailed(
      {required final bool isLoading,
      required final String message}) = _$ImagesAssetsFailedImpl;
  const _ImagesAssetsFailed._() : super._();

  factory _ImagesAssetsFailed.fromJson(Map<String, dynamic> json) =
      _$ImagesAssetsFailedImpl.fromJson;

  @override
  bool get isLoading;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ImagesAssetsFailedImplCopyWith<_$ImagesAssetsFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
