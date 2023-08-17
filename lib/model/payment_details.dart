import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details.freezed.dart';

part 'payment_details.g.dart';

@freezed
class PaymentDetails with _$PaymentDetails {
  const factory PaymentDetails({
    required final double packagingFee,
    required final double subtotal,
    required final double deliveryFee,
    required final double discount,
    required final double total,
  }) = _PaymentDetails;

  factory PaymentDetails.fromJson(Map<String, Object?> json) => _$PaymentDetailsFromJson(json);
}
