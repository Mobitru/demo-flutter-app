// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductOrder {

 String get id; List<ProductInfo> get products; User get user; PaymentDetails get paymentDetails; String get state;
/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOrderCopyWith<ProductOrder> get copyWith => _$ProductOrderCopyWithImpl<ProductOrder>(this as ProductOrder, _$identity);

  /// Serializes this ProductOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrder&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.user, user) || other.user == user)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(products),user,paymentDetails,state);

@override
String toString() {
  return 'ProductOrder(id: $id, products: $products, user: $user, paymentDetails: $paymentDetails, state: $state)';
}


}

/// @nodoc
abstract mixin class $ProductOrderCopyWith<$Res>  {
  factory $ProductOrderCopyWith(ProductOrder value, $Res Function(ProductOrder) _then) = _$ProductOrderCopyWithImpl;
@useResult
$Res call({
 String id, List<ProductInfo> products, User user, PaymentDetails paymentDetails, String state
});


$UserCopyWith<$Res> get user;$PaymentDetailsCopyWith<$Res> get paymentDetails;

}
/// @nodoc
class _$ProductOrderCopyWithImpl<$Res>
    implements $ProductOrderCopyWith<$Res> {
  _$ProductOrderCopyWithImpl(this._self, this._then);

  final ProductOrder _self;
  final $Res Function(ProductOrder) _then;

/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? products = null,Object? user = null,Object? paymentDetails = null,Object? state = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfo>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetails,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductOrder].
extension ProductOrderPatterns on ProductOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductOrder value)  $default,){
final _that = this;
switch (_that) {
case _ProductOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductOrder value)?  $default,){
final _that = this;
switch (_that) {
case _ProductOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<ProductInfo> products,  User user,  PaymentDetails paymentDetails,  String state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOrder() when $default != null:
return $default(_that.id,_that.products,_that.user,_that.paymentDetails,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<ProductInfo> products,  User user,  PaymentDetails paymentDetails,  String state)  $default,) {final _that = this;
switch (_that) {
case _ProductOrder():
return $default(_that.id,_that.products,_that.user,_that.paymentDetails,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<ProductInfo> products,  User user,  PaymentDetails paymentDetails,  String state)?  $default,) {final _that = this;
switch (_that) {
case _ProductOrder() when $default != null:
return $default(_that.id,_that.products,_that.user,_that.paymentDetails,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductOrder implements ProductOrder {
  const _ProductOrder({required this.id, required final  List<ProductInfo> products, required this.user, required this.paymentDetails, required this.state}): _products = products;
  factory _ProductOrder.fromJson(Map<String, dynamic> json) => _$ProductOrderFromJson(json);

@override final  String id;
 final  List<ProductInfo> _products;
@override List<ProductInfo> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  User user;
@override final  PaymentDetails paymentDetails;
@override final  String state;

/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductOrderCopyWith<_ProductOrder> get copyWith => __$ProductOrderCopyWithImpl<_ProductOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOrder&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.user, user) || other.user == user)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_products),user,paymentDetails,state);

@override
String toString() {
  return 'ProductOrder(id: $id, products: $products, user: $user, paymentDetails: $paymentDetails, state: $state)';
}


}

/// @nodoc
abstract mixin class _$ProductOrderCopyWith<$Res> implements $ProductOrderCopyWith<$Res> {
  factory _$ProductOrderCopyWith(_ProductOrder value, $Res Function(_ProductOrder) _then) = __$ProductOrderCopyWithImpl;
@override @useResult
$Res call({
 String id, List<ProductInfo> products, User user, PaymentDetails paymentDetails, String state
});


@override $UserCopyWith<$Res> get user;@override $PaymentDetailsCopyWith<$Res> get paymentDetails;

}
/// @nodoc
class __$ProductOrderCopyWithImpl<$Res>
    implements _$ProductOrderCopyWith<$Res> {
  __$ProductOrderCopyWithImpl(this._self, this._then);

  final _ProductOrder _self;
  final $Res Function(_ProductOrder) _then;

/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? products = null,Object? user = null,Object? paymentDetails = null,Object? state = null,}) {
  return _then(_ProductOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfo>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetails,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ProductOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}
}

// dart format on
