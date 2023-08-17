import 'package:flutter_demo_app/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.freezed.dart';

part 'product_info.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  const factory ProductInfo({
    required final Product product,
    required final int quantity,
  }) = _ProductInfo;

  factory ProductInfo.fromJson(Map<String, Object?> json) => _$ProductInfoFromJson(json);
}
