// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return _ProductOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductOrder {
  String get id => throw _privateConstructorUsedError;
  List<ProductInfo> get products => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  PaymentDetails get paymentDetails => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOrderCopyWith<ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOrderCopyWith<$Res> {
  factory $ProductOrderCopyWith(
          ProductOrder value, $Res Function(ProductOrder) then) =
      _$ProductOrderCopyWithImpl<$Res, ProductOrder>;
  @useResult
  $Res call(
      {String id,
      List<ProductInfo> products,
      User user,
      PaymentDetails paymentDetails,
      String state});

  $UserCopyWith<$Res> get user;
  $PaymentDetailsCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class _$ProductOrderCopyWithImpl<$Res, $Val extends ProductOrder>
    implements $ProductOrderCopyWith<$Res> {
  _$ProductOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? products = null,
    Object? user = null,
    Object? paymentDetails = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductInfo>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetails,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsCopyWith<$Res> get paymentDetails {
    return $PaymentDetailsCopyWith<$Res>(_value.paymentDetails, (value) {
      return _then(_value.copyWith(paymentDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductOrderCopyWith<$Res>
    implements $ProductOrderCopyWith<$Res> {
  factory _$$_ProductOrderCopyWith(
          _$_ProductOrder value, $Res Function(_$_ProductOrder) then) =
      __$$_ProductOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<ProductInfo> products,
      User user,
      PaymentDetails paymentDetails,
      String state});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $PaymentDetailsCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class __$$_ProductOrderCopyWithImpl<$Res>
    extends _$ProductOrderCopyWithImpl<$Res, _$_ProductOrder>
    implements _$$_ProductOrderCopyWith<$Res> {
  __$$_ProductOrderCopyWithImpl(
      _$_ProductOrder _value, $Res Function(_$_ProductOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? products = null,
    Object? user = null,
    Object? paymentDetails = null,
    Object? state = null,
  }) {
    return _then(_$_ProductOrder(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductInfo>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetails,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductOrder implements _ProductOrder {
  const _$_ProductOrder(
      {required this.id,
      required final List<ProductInfo> products,
      required this.user,
      required this.paymentDetails,
      required this.state})
      : _products = products;

  factory _$_ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOrderFromJson(json);

  @override
  final String id;
  final List<ProductInfo> _products;
  @override
  List<ProductInfo> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final User user;
  @override
  final PaymentDetails paymentDetails;
  @override
  final String state;

  @override
  String toString() {
    return 'ProductOrder(id: $id, products: $products, user: $user, paymentDetails: $paymentDetails, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductOrder &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.paymentDetails, paymentDetails) ||
                other.paymentDetails == paymentDetails) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_products),
      user,
      paymentDetails,
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductOrderCopyWith<_$_ProductOrder> get copyWith =>
      __$$_ProductOrderCopyWithImpl<_$_ProductOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOrderToJson(
      this,
    );
  }
}

abstract class _ProductOrder implements ProductOrder {
  const factory _ProductOrder(
      {required final String id,
      required final List<ProductInfo> products,
      required final User user,
      required final PaymentDetails paymentDetails,
      required final String state}) = _$_ProductOrder;

  factory _ProductOrder.fromJson(Map<String, dynamic> json) =
      _$_ProductOrder.fromJson;

  @override
  String get id;
  @override
  List<ProductInfo> get products;
  @override
  User get user;
  @override
  PaymentDetails get paymentDetails;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$_ProductOrderCopyWith<_$_ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
