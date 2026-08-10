// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Images _$ImagesFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'web':
          return _ImagesWeb.fromJson(
            json
          );
                case 'local':
          return _ImagesLocal.fromJson(
            json
          );
                case 'error':
          return _ImagesError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Images',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Images {



  /// Serializes this Images to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Images);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Images()';
}


}

/// @nodoc
class $ImagesCopyWith<$Res>  {
$ImagesCopyWith(Images _, $Res Function(Images) __);
}


/// Adds pattern-matching-related methods to [Images].
extension ImagesPatterns on Images {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImagesWeb value)?  web,TResult Function( _ImagesLocal value)?  local,TResult Function( _ImagesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImagesWeb() when web != null:
return web(_that);case _ImagesLocal() when local != null:
return local(_that);case _ImagesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImagesWeb value)  web,required TResult Function( _ImagesLocal value)  local,required TResult Function( _ImagesError value)  error,}){
final _that = this;
switch (_that) {
case _ImagesWeb():
return web(_that);case _ImagesLocal():
return local(_that);case _ImagesError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImagesWeb value)?  web,TResult? Function( _ImagesLocal value)?  local,TResult? Function( _ImagesError value)?  error,}){
final _that = this;
switch (_that) {
case _ImagesWeb() when web != null:
return web(_that);case _ImagesLocal() when local != null:
return local(_that);case _ImagesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  web,TResult Function(@AssetsImageConverter()  List<LocalImages> images)?  local,TResult Function( String error,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImagesWeb() when web != null:
return web(_that.name);case _ImagesLocal() when local != null:
return local(_that.images);case _ImagesError() when error != null:
return error(_that.error,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  web,required TResult Function(@AssetsImageConverter()  List<LocalImages> images)  local,required TResult Function( String error,  String message)  error,}) {final _that = this;
switch (_that) {
case _ImagesWeb():
return web(_that.name);case _ImagesLocal():
return local(_that.images);case _ImagesError():
return error(_that.error,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  web,TResult? Function(@AssetsImageConverter()  List<LocalImages> images)?  local,TResult? Function( String error,  String message)?  error,}) {final _that = this;
switch (_that) {
case _ImagesWeb() when web != null:
return web(_that.name);case _ImagesLocal() when local != null:
return local(_that.images);case _ImagesError() when error != null:
return error(_that.error,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImagesWeb extends Images {
  const _ImagesWeb({required this.name, final  String? $type}): $type = $type ?? 'web',super._();
  factory _ImagesWeb.fromJson(Map<String, dynamic> json) => _$ImagesWebFromJson(json);

 final  String name;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesWebCopyWith<_ImagesWeb> get copyWith => __$ImagesWebCopyWithImpl<_ImagesWeb>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagesWebToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesWeb&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Images.web(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ImagesWebCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$ImagesWebCopyWith(_ImagesWeb value, $Res Function(_ImagesWeb) _then) = __$ImagesWebCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ImagesWebCopyWithImpl<$Res>
    implements _$ImagesWebCopyWith<$Res> {
  __$ImagesWebCopyWithImpl(this._self, this._then);

  final _ImagesWeb _self;
  final $Res Function(_ImagesWeb) _then;

/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ImagesWeb(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ImagesLocal extends Images {
  const _ImagesLocal({@AssetsImageConverter() required final  List<LocalImages> images, final  String? $type}): _images = images,$type = $type ?? 'local',super._();
  factory _ImagesLocal.fromJson(Map<String, dynamic> json) => _$ImagesLocalFromJson(json);

 final  List<LocalImages> _images;
@AssetsImageConverter() List<LocalImages> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesLocalCopyWith<_ImagesLocal> get copyWith => __$ImagesLocalCopyWithImpl<_ImagesLocal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagesLocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesLocal&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Images.local(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImagesLocalCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$ImagesLocalCopyWith(_ImagesLocal value, $Res Function(_ImagesLocal) _then) = __$ImagesLocalCopyWithImpl;
@useResult
$Res call({
@AssetsImageConverter() List<LocalImages> images
});




}
/// @nodoc
class __$ImagesLocalCopyWithImpl<$Res>
    implements _$ImagesLocalCopyWith<$Res> {
  __$ImagesLocalCopyWithImpl(this._self, this._then);

  final _ImagesLocal _self;
  final $Res Function(_ImagesLocal) _then;

/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImagesLocal(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<LocalImages>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ImagesError extends Images {
  const _ImagesError({required this.error, required this.message, final  String? $type}): $type = $type ?? 'error',super._();
  factory _ImagesError.fromJson(Map<String, dynamic> json) => _$ImagesErrorFromJson(json);

 final  String error;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesErrorCopyWith<_ImagesError> get copyWith => __$ImagesErrorCopyWithImpl<_ImagesError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagesErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesError&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message);

@override
String toString() {
  return 'Images.error(error: $error, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ImagesErrorCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$ImagesErrorCopyWith(_ImagesError value, $Res Function(_ImagesError) _then) = __$ImagesErrorCopyWithImpl;
@useResult
$Res call({
 String error, String message
});




}
/// @nodoc
class __$ImagesErrorCopyWithImpl<$Res>
    implements _$ImagesErrorCopyWith<$Res> {
  __$ImagesErrorCopyWithImpl(this._self, this._then);

  final _ImagesError _self;
  final $Res Function(_ImagesError) _then;

/// Create a copy of Images
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,}) {
  return _then(_ImagesError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

ImagesAssets _$ImagesAssetsFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'loading':
          return _ImagesAssetsLoading.fromJson(
            json
          );
                case 'failed':
          return _ImagesAssetsFailed.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ImagesAssets',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ImagesAssets {

 bool get isLoading;
/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImagesAssetsCopyWith<ImagesAssets> get copyWith => _$ImagesAssetsCopyWithImpl<ImagesAssets>(this as ImagesAssets, _$identity);

  /// Serializes this ImagesAssets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagesAssets&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'ImagesAssets(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ImagesAssetsCopyWith<$Res>  {
  factory $ImagesAssetsCopyWith(ImagesAssets value, $Res Function(ImagesAssets) _then) = _$ImagesAssetsCopyWithImpl;
@useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class _$ImagesAssetsCopyWithImpl<$Res>
    implements $ImagesAssetsCopyWith<$Res> {
  _$ImagesAssetsCopyWithImpl(this._self, this._then);

  final ImagesAssets _self;
  final $Res Function(ImagesAssets) _then;

/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImagesAssets].
extension ImagesAssetsPatterns on ImagesAssets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImagesAssetsLoading value)?  loading,TResult Function( _ImagesAssetsFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImagesAssetsLoading() when loading != null:
return loading(_that);case _ImagesAssetsFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImagesAssetsLoading value)  loading,required TResult Function( _ImagesAssetsFailed value)  failed,}){
final _that = this;
switch (_that) {
case _ImagesAssetsLoading():
return loading(_that);case _ImagesAssetsFailed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImagesAssetsLoading value)?  loading,TResult? Function( _ImagesAssetsFailed value)?  failed,}){
final _that = this;
switch (_that) {
case _ImagesAssetsLoading() when loading != null:
return loading(_that);case _ImagesAssetsFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Images> images,  bool isLoading)?  loading,TResult Function( bool isLoading,  String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImagesAssetsLoading() when loading != null:
return loading(_that.images,_that.isLoading);case _ImagesAssetsFailed() when failed != null:
return failed(_that.isLoading,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Images> images,  bool isLoading)  loading,required TResult Function( bool isLoading,  String message)  failed,}) {final _that = this;
switch (_that) {
case _ImagesAssetsLoading():
return loading(_that.images,_that.isLoading);case _ImagesAssetsFailed():
return failed(_that.isLoading,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Images> images,  bool isLoading)?  loading,TResult? Function( bool isLoading,  String message)?  failed,}) {final _that = this;
switch (_that) {
case _ImagesAssetsLoading() when loading != null:
return loading(_that.images,_that.isLoading);case _ImagesAssetsFailed() when failed != null:
return failed(_that.isLoading,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImagesAssetsLoading extends ImagesAssets {
  const _ImagesAssetsLoading({required final  List<Images> images, required this.isLoading, final  String? $type}): _images = images,$type = $type ?? 'loading',super._();
  factory _ImagesAssetsLoading.fromJson(Map<String, dynamic> json) => _$ImagesAssetsLoadingFromJson(json);

 final  List<Images> _images;
 List<Images> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  bool isLoading;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesAssetsLoadingCopyWith<_ImagesAssetsLoading> get copyWith => __$ImagesAssetsLoadingCopyWithImpl<_ImagesAssetsLoading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagesAssetsLoadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesAssetsLoading&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),isLoading);

@override
String toString() {
  return 'ImagesAssets.loading(images: $images, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ImagesAssetsLoadingCopyWith<$Res> implements $ImagesAssetsCopyWith<$Res> {
  factory _$ImagesAssetsLoadingCopyWith(_ImagesAssetsLoading value, $Res Function(_ImagesAssetsLoading) _then) = __$ImagesAssetsLoadingCopyWithImpl;
@override @useResult
$Res call({
 List<Images> images, bool isLoading
});




}
/// @nodoc
class __$ImagesAssetsLoadingCopyWithImpl<$Res>
    implements _$ImagesAssetsLoadingCopyWith<$Res> {
  __$ImagesAssetsLoadingCopyWithImpl(this._self, this._then);

  final _ImagesAssetsLoading _self;
  final $Res Function(_ImagesAssetsLoading) _then;

/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,Object? isLoading = null,}) {
  return _then(_ImagesAssetsLoading(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Images>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ImagesAssetsFailed extends ImagesAssets {
  const _ImagesAssetsFailed({required this.isLoading, required this.message, final  String? $type}): $type = $type ?? 'failed',super._();
  factory _ImagesAssetsFailed.fromJson(Map<String, dynamic> json) => _$ImagesAssetsFailedFromJson(json);

@override final  bool isLoading;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesAssetsFailedCopyWith<_ImagesAssetsFailed> get copyWith => __$ImagesAssetsFailedCopyWithImpl<_ImagesAssetsFailed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagesAssetsFailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesAssetsFailed&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,message);

@override
String toString() {
  return 'ImagesAssets.failed(isLoading: $isLoading, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ImagesAssetsFailedCopyWith<$Res> implements $ImagesAssetsCopyWith<$Res> {
  factory _$ImagesAssetsFailedCopyWith(_ImagesAssetsFailed value, $Res Function(_ImagesAssetsFailed) _then) = __$ImagesAssetsFailedCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String message
});




}
/// @nodoc
class __$ImagesAssetsFailedCopyWithImpl<$Res>
    implements _$ImagesAssetsFailedCopyWith<$Res> {
  __$ImagesAssetsFailedCopyWithImpl(this._self, this._then);

  final _ImagesAssetsFailed _self;
  final $Res Function(_ImagesAssetsFailed) _then;

/// Create a copy of ImagesAssets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? message = null,}) {
  return _then(_ImagesAssetsFailed(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
