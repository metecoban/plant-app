// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantImageModel {

 String get url;
/// Create a copy of PlantImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantImageModelCopyWith<PlantImageModel> get copyWith => _$PlantImageModelCopyWithImpl<PlantImageModel>(this as PlantImageModel, _$identity);

  /// Serializes this PlantImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantImageModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'PlantImageModel(url: $url)';
}


}

/// @nodoc
abstract mixin class $PlantImageModelCopyWith<$Res>  {
  factory $PlantImageModelCopyWith(PlantImageModel value, $Res Function(PlantImageModel) _then) = _$PlantImageModelCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$PlantImageModelCopyWithImpl<$Res>
    implements $PlantImageModelCopyWith<$Res> {
  _$PlantImageModelCopyWithImpl(this._self, this._then);

  final PlantImageModel _self;
  final $Res Function(PlantImageModel) _then;

/// Create a copy of PlantImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(PlantImageModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlantImageModel].
extension PlantImageModelPatterns on PlantImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlantImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlantImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlantImageModel value)  $default,){
final _that = this;
switch (_that) {
case _PlantImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlantImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlantImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlantImageModel() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _PlantImageModel():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _PlantImageModel() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlantImageModel implements PlantImageModel {
  const _PlantImageModel({required this.url});
  factory _PlantImageModel.fromJson(Map<String, dynamic> json) => _$PlantImageModelFromJson(json);

@override final  String url;

/// Create a copy of PlantImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantImageModelCopyWith<_PlantImageModel> get copyWith => __$PlantImageModelCopyWithImpl<_PlantImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantImageModel&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'PlantImageModel(url: $url)';
}


}

/// @nodoc
abstract mixin class _$PlantImageModelCopyWith<$Res> implements $PlantImageModelCopyWith<$Res> {
  factory _$PlantImageModelCopyWith(_PlantImageModel value, $Res Function(_PlantImageModel) _then) = __$PlantImageModelCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$PlantImageModelCopyWithImpl<$Res>
    implements _$PlantImageModelCopyWith<$Res> {
  __$PlantImageModelCopyWithImpl(this._self, this._then);

  final _PlantImageModel _self;
  final $Res Function(_PlantImageModel) _then;

/// Create a copy of PlantImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_PlantImageModel(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
