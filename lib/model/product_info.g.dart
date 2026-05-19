// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => _ProductInfo(
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$ProductInfoToJson(_ProductInfo instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
