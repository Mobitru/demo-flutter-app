import 'package:flutter_demo_app/model/payment_details.dart';
import 'package:flutter_demo_app/model/product_info.dart';
import 'package:flutter_demo_app/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class ProductOrder with _$ProductOrder {
  const factory ProductOrder({
    required final String id,
    required List<ProductInfo> products,
    required final User user,
    required final PaymentDetails paymentDetails,
    required final String state,
  }) = _ProductOrder;

  factory ProductOrder.fromJson(Map<String, Object?> json) => _$ProductOrderFromJson(json);
}
