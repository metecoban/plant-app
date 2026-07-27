// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStarted value)?  started,TResult Function( HomeRefreshed value)?  refreshed,TResult Function( HomeRetryRequested value)?  retryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeRefreshed() when refreshed != null:
return refreshed(_that);case HomeRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStarted value)  started,required TResult Function( HomeRefreshed value)  refreshed,required TResult Function( HomeRetryRequested value)  retryRequested,}){
final _that = this;
switch (_that) {
case HomeStarted():
return started(_that);case HomeRefreshed():
return refreshed(_that);case HomeRetryRequested():
return retryRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStarted value)?  started,TResult? Function( HomeRefreshed value)?  refreshed,TResult? Function( HomeRetryRequested value)?  retryRequested,}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeRefreshed() when refreshed != null:
return refreshed(_that);case HomeRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function()?  retryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeRefreshed() when refreshed != null:
return refreshed();case HomeRetryRequested() when retryRequested != null:
return retryRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function()  retryRequested,}) {final _that = this;
switch (_that) {
case HomeStarted():
return started();case HomeRefreshed():
return refreshed();case HomeRetryRequested():
return retryRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function()?  retryRequested,}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeRefreshed() when refreshed != null:
return refreshed();case HomeRetryRequested() when retryRequested != null:
return retryRequested();case _:
  return null;

}
}

}

/// @nodoc


class HomeStarted implements HomeEvent {
  const HomeStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.started()';
}


}




/// @nodoc


class HomeRefreshed implements HomeEvent {
  const HomeRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refreshed()';
}


}




/// @nodoc


class HomeRetryRequested implements HomeEvent {
  const HomeRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.retryRequested()';
}


}




// dart format on
