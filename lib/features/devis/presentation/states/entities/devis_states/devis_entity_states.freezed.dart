// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DevisEntityStates implements DiagnosticableTreeMixin {

 List<DevisModelEntity> get devis;
/// Create a copy of DevisEntityStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevisEntityStatesCopyWith<DevisEntityStates> get copyWith => _$DevisEntityStatesCopyWithImpl<DevisEntityStates>(this as DevisEntityStates, _$identity);

  /// Serializes this DevisEntityStates to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DevisEntityStates'))
    ..add(DiagnosticsProperty('devis', devis));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevisEntityStates&&const DeepCollectionEquality().equals(other.devis, devis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(devis));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DevisEntityStates(devis: $devis)';
}


}

/// @nodoc
abstract mixin class $DevisEntityStatesCopyWith<$Res>  {
  factory $DevisEntityStatesCopyWith(DevisEntityStates value, $Res Function(DevisEntityStates) _then) = _$DevisEntityStatesCopyWithImpl;
@useResult
$Res call({
 List<DevisModelEntity> devis
});




}
/// @nodoc
class _$DevisEntityStatesCopyWithImpl<$Res>
    implements $DevisEntityStatesCopyWith<$Res> {
  _$DevisEntityStatesCopyWithImpl(this._self, this._then);

  final DevisEntityStates _self;
  final $Res Function(DevisEntityStates) _then;

/// Create a copy of DevisEntityStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? devis = null,}) {
  return _then(_self.copyWith(
devis: null == devis ? _self.devis : devis // ignore: cast_nullable_to_non_nullable
as List<DevisModelEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [DevisEntityStates].
extension DevisEntityStatesPatterns on DevisEntityStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevisEntityStates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevisEntityStates() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevisEntityStates value)  $default,){
final _that = this;
switch (_that) {
case _DevisEntityStates():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevisEntityStates value)?  $default,){
final _that = this;
switch (_that) {
case _DevisEntityStates() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DevisModelEntity> devis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevisEntityStates() when $default != null:
return $default(_that.devis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DevisModelEntity> devis)  $default,) {final _that = this;
switch (_that) {
case _DevisEntityStates():
return $default(_that.devis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DevisModelEntity> devis)?  $default,) {final _that = this;
switch (_that) {
case _DevisEntityStates() when $default != null:
return $default(_that.devis);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _DevisEntityStates with DiagnosticableTreeMixin implements DevisEntityStates {
  const _DevisEntityStates({required final  List<DevisModelEntity> devis}): _devis = devis;
  factory _DevisEntityStates.fromJson(Map<String, dynamic> json) => _$DevisEntityStatesFromJson(json);

 final  List<DevisModelEntity> _devis;
@override List<DevisModelEntity> get devis {
  if (_devis is EqualUnmodifiableListView) return _devis;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devis);
}


/// Create a copy of DevisEntityStates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevisEntityStatesCopyWith<_DevisEntityStates> get copyWith => __$DevisEntityStatesCopyWithImpl<_DevisEntityStates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevisEntityStatesToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DevisEntityStates'))
    ..add(DiagnosticsProperty('devis', devis));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevisEntityStates&&const DeepCollectionEquality().equals(other._devis, _devis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devis));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DevisEntityStates(devis: $devis)';
}


}

/// @nodoc
abstract mixin class _$DevisEntityStatesCopyWith<$Res> implements $DevisEntityStatesCopyWith<$Res> {
  factory _$DevisEntityStatesCopyWith(_DevisEntityStates value, $Res Function(_DevisEntityStates) _then) = __$DevisEntityStatesCopyWithImpl;
@override @useResult
$Res call({
 List<DevisModelEntity> devis
});




}
/// @nodoc
class __$DevisEntityStatesCopyWithImpl<$Res>
    implements _$DevisEntityStatesCopyWith<$Res> {
  __$DevisEntityStatesCopyWithImpl(this._self, this._then);

  final _DevisEntityStates _self;
  final $Res Function(_DevisEntityStates) _then;

/// Create a copy of DevisEntityStates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? devis = null,}) {
  return _then(_DevisEntityStates(
devis: null == devis ? _self._devis : devis // ignore: cast_nullable_to_non_nullable
as List<DevisModelEntity>,
  ));
}


}

// dart format on
