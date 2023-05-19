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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_ImagesWebCopyWith<$Res> {
  factory _$$_ImagesWebCopyWith(
          _$_ImagesWeb value, $Res Function(_$_ImagesWeb) then) =
      __$$_ImagesWebCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_ImagesWebCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$_ImagesWeb>
    implements _$$_ImagesWebCopyWith<$Res> {
  __$$_ImagesWebCopyWithImpl(
      _$_ImagesWeb _value, $Res Function(_$_ImagesWeb) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_ImagesWeb(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagesWeb implements _ImagesWeb {
  const _$_ImagesWeb({required this.name, final String? $type})
      : $type = $type ?? 'web';

  factory _$_ImagesWeb.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesWebFromJson(json);

  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Images.web(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesWeb &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesWebCopyWith<_$_ImagesWeb> get copyWith =>
      __$$_ImagesWebCopyWithImpl<_$_ImagesWeb>(this, _$identity);

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
    return _$$_ImagesWebToJson(
      this,
    );
  }
}

abstract class _ImagesWeb implements Images {
  const factory _ImagesWeb({required final String name}) = _$_ImagesWeb;

  factory _ImagesWeb.fromJson(Map<String, dynamic> json) =
      _$_ImagesWeb.fromJson;

  String get name;
  @JsonKey(ignore: true)
  _$$_ImagesWebCopyWith<_$_ImagesWeb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImagesLocalCopyWith<$Res> {
  factory _$$_ImagesLocalCopyWith(
          _$_ImagesLocal value, $Res Function(_$_ImagesLocal) then) =
      __$$_ImagesLocalCopyWithImpl<$Res>;
  @useResult
  $Res call({@AssetsImageConverter() List<LocalImages> images});
}

/// @nodoc
class __$$_ImagesLocalCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$_ImagesLocal>
    implements _$$_ImagesLocalCopyWith<$Res> {
  __$$_ImagesLocalCopyWithImpl(
      _$_ImagesLocal _value, $Res Function(_$_ImagesLocal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$_ImagesLocal(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<LocalImages>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagesLocal implements _ImagesLocal {
  const _$_ImagesLocal(
      {@AssetsImageConverter() required final List<LocalImages> images,
      final String? $type})
      : _images = images,
        $type = $type ?? 'local';

  factory _$_ImagesLocal.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesLocalFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesLocal &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesLocalCopyWith<_$_ImagesLocal> get copyWith =>
      __$$_ImagesLocalCopyWithImpl<_$_ImagesLocal>(this, _$identity);

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
    return _$$_ImagesLocalToJson(
      this,
    );
  }
}

abstract class _ImagesLocal implements Images {
  const factory _ImagesLocal(
          {@AssetsImageConverter() required final List<LocalImages> images}) =
      _$_ImagesLocal;

  factory _ImagesLocal.fromJson(Map<String, dynamic> json) =
      _$_ImagesLocal.fromJson;

  @AssetsImageConverter()
  List<LocalImages> get images;
  @JsonKey(ignore: true)
  _$$_ImagesLocalCopyWith<_$_ImagesLocal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImagesErrorCopyWith<$Res> {
  factory _$$_ImagesErrorCopyWith(
          _$_ImagesError value, $Res Function(_$_ImagesError) then) =
      __$$_ImagesErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String message});
}

/// @nodoc
class __$$_ImagesErrorCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$_ImagesError>
    implements _$$_ImagesErrorCopyWith<$Res> {
  __$$_ImagesErrorCopyWithImpl(
      _$_ImagesError _value, $Res Function(_$_ImagesError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_$_ImagesError(
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
class _$_ImagesError implements _ImagesError {
  const _$_ImagesError(
      {required this.error, required this.message, final String? $type})
      : $type = $type ?? 'error';

  factory _$_ImagesError.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesErrorFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesError &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesErrorCopyWith<_$_ImagesError> get copyWith =>
      __$$_ImagesErrorCopyWithImpl<_$_ImagesError>(this, _$identity);

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
    return _$$_ImagesErrorToJson(
      this,
    );
  }
}

abstract class _ImagesError implements Images {
  const factory _ImagesError(
      {required final String error,
      required final String message}) = _$_ImagesError;

  factory _ImagesError.fromJson(Map<String, dynamic> json) =
      _$_ImagesError.fromJson;

  String get error;
  String get message;
  @JsonKey(ignore: true)
  _$$_ImagesErrorCopyWith<_$_ImagesError> get copyWith =>
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
abstract class _$$_ImagesAssetsLoadingCopyWith<$Res>
    implements $ImagesAssetsCopyWith<$Res> {
  factory _$$_ImagesAssetsLoadingCopyWith(_$_ImagesAssetsLoading value,
          $Res Function(_$_ImagesAssetsLoading) then) =
      __$$_ImagesAssetsLoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Images> images, bool isLoading});
}

/// @nodoc
class __$$_ImagesAssetsLoadingCopyWithImpl<$Res>
    extends _$ImagesAssetsCopyWithImpl<$Res, _$_ImagesAssetsLoading>
    implements _$$_ImagesAssetsLoadingCopyWith<$Res> {
  __$$_ImagesAssetsLoadingCopyWithImpl(_$_ImagesAssetsLoading _value,
      $Res Function(_$_ImagesAssetsLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ImagesAssetsLoading(
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
class _$_ImagesAssetsLoading extends _ImagesAssetsLoading {
  const _$_ImagesAssetsLoading(
      {required final List<Images> images,
      required this.isLoading,
      final String? $type})
      : _images = images,
        $type = $type ?? 'loading',
        super._();

  factory _$_ImagesAssetsLoading.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesAssetsLoadingFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesAssetsLoading &&
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
  _$$_ImagesAssetsLoadingCopyWith<_$_ImagesAssetsLoading> get copyWith =>
      __$$_ImagesAssetsLoadingCopyWithImpl<_$_ImagesAssetsLoading>(
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
    return _$$_ImagesAssetsLoadingToJson(
      this,
    );
  }
}

abstract class _ImagesAssetsLoading extends ImagesAssets {
  const factory _ImagesAssetsLoading(
      {required final List<Images> images,
      required final bool isLoading}) = _$_ImagesAssetsLoading;
  const _ImagesAssetsLoading._() : super._();

  factory _ImagesAssetsLoading.fromJson(Map<String, dynamic> json) =
      _$_ImagesAssetsLoading.fromJson;

  List<Images> get images;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesAssetsLoadingCopyWith<_$_ImagesAssetsLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImagesAssetsFailedCopyWith<$Res>
    implements $ImagesAssetsCopyWith<$Res> {
  factory _$$_ImagesAssetsFailedCopyWith(_$_ImagesAssetsFailed value,
          $Res Function(_$_ImagesAssetsFailed) then) =
      __$$_ImagesAssetsFailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String message});
}

/// @nodoc
class __$$_ImagesAssetsFailedCopyWithImpl<$Res>
    extends _$ImagesAssetsCopyWithImpl<$Res, _$_ImagesAssetsFailed>
    implements _$$_ImagesAssetsFailedCopyWith<$Res> {
  __$$_ImagesAssetsFailedCopyWithImpl(
      _$_ImagesAssetsFailed _value, $Res Function(_$_ImagesAssetsFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? message = null,
  }) {
    return _then(_$_ImagesAssetsFailed(
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
class _$_ImagesAssetsFailed extends _ImagesAssetsFailed {
  const _$_ImagesAssetsFailed(
      {required this.isLoading, required this.message, final String? $type})
      : $type = $type ?? 'failed',
        super._();

  factory _$_ImagesAssetsFailed.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesAssetsFailedFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesAssetsFailed &&
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
  _$$_ImagesAssetsFailedCopyWith<_$_ImagesAssetsFailed> get copyWith =>
      __$$_ImagesAssetsFailedCopyWithImpl<_$_ImagesAssetsFailed>(
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
    return _$$_ImagesAssetsFailedToJson(
      this,
    );
  }
}

abstract class _ImagesAssetsFailed extends ImagesAssets {
  const factory _ImagesAssetsFailed(
      {required final bool isLoading,
      required final String message}) = _$_ImagesAssetsFailed;
  const _ImagesAssetsFailed._() : super._();

  factory _ImagesAssetsFailed.fromJson(Map<String, dynamic> json) =
      _$_ImagesAssetsFailed.fromJson;

  @override
  bool get isLoading;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesAssetsFailedCopyWith<_$_ImagesAssetsFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
