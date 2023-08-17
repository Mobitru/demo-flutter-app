// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return _PaymentDetails.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetails {
  double get packagingFee => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call(
      {double packagingFee,
      double subtotal,
      double deliveryFee,
      double discount,
      double total});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagingFee = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      packagingFee: null == packagingFee
          ? _value.packagingFee
          : packagingFee // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$_PaymentDetailsCopyWith(
          _$_PaymentDetails value, $Res Function(_$_PaymentDetails) then) =
      __$$_PaymentDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double packagingFee,
      double subtotal,
      double deliveryFee,
      double discount,
      double total});
}

/// @nodoc
class __$$_PaymentDetailsCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$_PaymentDetails>
    implements _$$_PaymentDetailsCopyWith<$Res> {
  __$$_PaymentDetailsCopyWithImpl(
      _$_PaymentDetails _value, $Res Function(_$_PaymentDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagingFee = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? total = null,
  }) {
    return _then(_$_PaymentDetails(
      packagingFee: null == packagingFee
          ? _value.packagingFee
          : packagingFee // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentDetails implements _PaymentDetails {
  const _$_PaymentDetails(
      {required this.packagingFee,
      required this.subtotal,
      required this.deliveryFee,
      required this.discount,
      required this.total});

  factory _$_PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsFromJson(json);

  @override
  final double packagingFee;
  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double discount;
  @override
  final double total;

  @override
  String toString() {
    return 'PaymentDetails(packagingFee: $packagingFee, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetails &&
            (identical(other.packagingFee, packagingFee) ||
                other.packagingFee == packagingFee) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, packagingFee, subtotal, deliveryFee, discount, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      __$$_PaymentDetailsCopyWithImpl<_$_PaymentDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsToJson(
      this,
    );
  }
}

abstract class _PaymentDetails implements PaymentDetails {
  const factory _PaymentDetails(
      {required final double packagingFee,
      required final double subtotal,
      required final double deliveryFee,
      required final double discount,
      required final double total}) = _$_PaymentDetails;

  factory _PaymentDetails.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetails.fromJson;

  @override
  double get packagingFee;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get discount;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
