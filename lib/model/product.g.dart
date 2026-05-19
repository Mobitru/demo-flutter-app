// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  image: json['image'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  discountPrice: (json['discountPrice'] as num?)?.toDouble(),
  discountValue: json['discountValue'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'name': instance.name,
  'price': instance.price,
  'discountPrice': instance.discountPrice,
  'discountValue': instance.discountValue,
};
