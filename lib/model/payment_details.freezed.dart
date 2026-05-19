// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetails {

 double get packagingFee; double get subtotal; double get deliveryFee; double get discount; double get total;
/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<PaymentDetails> get copyWith => _$PaymentDetailsCopyWithImpl<PaymentDetails>(this as PaymentDetails, _$identity);

  /// Serializes this PaymentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetails&&(identical(other.packagingFee, packagingFee) || other.packagingFee == packagingFee)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packagingFee,subtotal,deliveryFee,discount,total);

@override
String toString() {
  return 'PaymentDetails(packagingFee: $packagingFee, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailsCopyWith<$Res>  {
  factory $PaymentDetailsCopyWith(PaymentDetails value, $Res Function(PaymentDetails) _then) = _$PaymentDetailsCopyWithImpl;
@useResult
$Res call({
 double packagingFee, double subtotal, double deliveryFee, double discount, double total
});




}
/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._self, this._then);

  final PaymentDetails _self;
  final $Res Function(PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packagingFee = null,Object? subtotal = null,Object? deliveryFee = null,Object? discount = null,Object? total = null,}) {
  return _then(_self.copyWith(
packagingFee: null == packagingFee ? _self.packagingFee : packagingFee // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetails].
extension PaymentDetailsPatterns on PaymentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double packagingFee,  double subtotal,  double deliveryFee,  double discount,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.packagingFee,_that.subtotal,_that.deliveryFee,_that.discount,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double packagingFee,  double subtotal,  double deliveryFee,  double discount,  double total)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails():
return $default(_that.packagingFee,_that.subtotal,_that.deliveryFee,_that.discount,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double packagingFee,  double subtotal,  double deliveryFee,  double discount,  double total)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.packagingFee,_that.subtotal,_that.deliveryFee,_that.discount,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetails implements PaymentDetails {
  const _PaymentDetails({required this.packagingFee, required this.subtotal, required this.deliveryFee, required this.discount, required this.total});
  factory _PaymentDetails.fromJson(Map<String, dynamic> json) => _$PaymentDetailsFromJson(json);

@override final  double packagingFee;
@override final  double subtotal;
@override final  double deliveryFee;
@override final  double discount;
@override final  double total;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailsCopyWith<_PaymentDetails> get copyWith => __$PaymentDetailsCopyWithImpl<_PaymentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetails&&(identical(other.packagingFee, packagingFee) || other.packagingFee == packagingFee)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packagingFee,subtotal,deliveryFee,discount,total);

@override
String toString() {
  return 'PaymentDetails(packagingFee: $packagingFee, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailsCopyWith<$Res> implements $PaymentDetailsCopyWith<$Res> {
  factory _$PaymentDetailsCopyWith(_PaymentDetails value, $Res Function(_PaymentDetails) _then) = __$PaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 double packagingFee, double subtotal, double deliveryFee, double discount, double total
});




}
/// @nodoc
class __$PaymentDetailsCopyWithImpl<$Res>
    implements _$PaymentDetailsCopyWith<$Res> {
  __$PaymentDetailsCopyWithImpl(this._self, this._then);

  final _PaymentDetails _self;
  final $Res Function(_PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packagingFee = null,Object? subtotal = null,Object? deliveryFee = null,Object? discount = null,Object? total = null,}) {
  return _then(_PaymentDetails(
packagingFee: null == packagingFee ? _self.packagingFee : packagingFee // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
