// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentDetails _$$_PaymentDetailsFromJson(Map<String, dynamic> json) =>
    _$_PaymentDetails(
      packagingFee: (json['packagingFee'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PaymentDetailsToJson(_$_PaymentDetails instance) =>
    <String, dynamic>{
      'packagingFee': instance.packagingFee,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'total': instance.total,
    };
