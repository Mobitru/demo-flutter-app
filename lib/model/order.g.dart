// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) =>
    _ProductOrder(
      id: json['id'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      paymentDetails: PaymentDetails.fromJson(
        json['paymentDetails'] as Map<String, dynamic>,
      ),
      state: json['state'] as String,
    );

Map<String, dynamic> _$ProductOrderToJson(_ProductOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'user': instance.user,
      'paymentDetails': instance.paymentDetails,
      'state': instance.state,
    };
