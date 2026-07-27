// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeInitial value)?  initial,TResult Function( HomeLoading value)?  loading,TResult Function( HomeSuccess value)?  success,TResult Function( HomeEmpty value)?  empty,TResult Function( HomeFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeSuccess() when success != null:
return success(_that);case HomeEmpty() when empty != null:
return empty(_that);case HomeFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeInitial value)  initial,required TResult Function( HomeLoading value)  loading,required TResult Function( HomeSuccess value)  success,required TResult Function( HomeEmpty value)  empty,required TResult Function( HomeFailure value)  failure,}){
final _that = this;
switch (_that) {
case HomeInitial():
return initial(_that);case HomeLoading():
return loading(_that);case HomeSuccess():
return success(_that);case HomeEmpty():
return empty(_that);case HomeFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeInitial value)?  initial,TResult? Function( HomeLoading value)?  loading,TResult? Function( HomeSuccess value)?  success,TResult? Function( HomeEmpty value)?  empty,TResult? Function( HomeFailure value)?  failure,}){
final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeSuccess() when success != null:
return success(_that);case HomeEmpty() when empty != null:
return empty(_that);case HomeFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Question> questions,  List<Plant> plants,  bool isRefreshing)?  success,TResult Function()?  empty,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading();case HomeSuccess() when success != null:
return success(_that.questions,_that.plants,_that.isRefreshing);case HomeEmpty() when empty != null:
return empty();case HomeFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Question> questions,  List<Plant> plants,  bool isRefreshing)  success,required TResult Function()  empty,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case HomeInitial():
return initial();case HomeLoading():
return loading();case HomeSuccess():
return success(_that.questions,_that.plants,_that.isRefreshing);case HomeEmpty():
return empty();case HomeFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Question> questions,  List<Plant> plants,  bool isRefreshing)?  success,TResult? Function()?  empty,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading();case HomeSuccess() when success != null:
return success(_that.questions,_that.plants,_that.isRefreshing);case HomeEmpty() when empty != null:
return empty();case HomeFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class HomeInitial implements HomeState {
  const HomeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class HomeLoading implements HomeState {
  const HomeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class HomeSuccess implements HomeState {
  const HomeSuccess({required  List<Question> questions, required  List<Plant> plants, this.isRefreshing = false}): _questions = questions,_plants = plants;
  

 final  List<Question> _questions;
 List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<Plant> _plants;
 List<Plant> get plants {
  if (_plants is EqualUnmodifiableListView) return _plants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plants);
}

@JsonKey() final  bool isRefreshing;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSuccessCopyWith<HomeSuccess> get copyWith => _$HomeSuccessCopyWithImpl<HomeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSuccess&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._plants, _plants)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_plants),isRefreshing);

@override
String toString() {
  return 'HomeState.success(questions: $questions, plants: $plants, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $HomeSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeSuccessCopyWith(HomeSuccess value, $Res Function(HomeSuccess) _then) = _$HomeSuccessCopyWithImpl;
@useResult
$Res call({
 List<Question> questions, List<Plant> plants, bool isRefreshing
});




}
/// @nodoc
class _$HomeSuccessCopyWithImpl<$Res>
    implements $HomeSuccessCopyWith<$Res> {
  _$HomeSuccessCopyWithImpl(this._self, this._then);

  final HomeSuccess _self;
  final $Res Function(HomeSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? plants = null,Object? isRefreshing = null,}) {
  return _then(HomeSuccess(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,plants: null == plants ? _self._plants : plants // ignore: cast_nullable_to_non_nullable
as List<Plant>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class HomeEmpty implements HomeState {
  const HomeEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.empty()';
}


}




/// @nodoc


class HomeFailure implements HomeState {
  const HomeFailure({required this.failure});
  

 final  Failure failure;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeFailureCopyWith<HomeFailure> get copyWith => _$HomeFailureCopyWithImpl<HomeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'HomeState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $HomeFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeFailureCopyWith(HomeFailure value, $Res Function(HomeFailure) _then) = _$HomeFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$HomeFailureCopyWithImpl<$Res>
    implements $HomeFailureCopyWith<$Res> {
  _$HomeFailureCopyWithImpl(this._self, this._then);

  final HomeFailure _self;
  final $Res Function(HomeFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(HomeFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
