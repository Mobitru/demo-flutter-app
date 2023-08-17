import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/payment_details.dart';

class PaymentDetailsWidget extends StatelessWidget {
  final PaymentDetails details;
  const PaymentDetailsWidget({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final smallStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300, height: 1.3);

    final boldStyle = smallStyle?.copyWith(fontWeight: FontWeight.w600);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: primaryPadding / 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              packagingFeeLabel,
              style: smallStyle,
            ),
            Text(
              details.packagingFee.toStringAsFixed(2),
              style: smallStyle,
            )
          ],
        ),
        const SizedBox(
          height: primaryPadding / 2,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            subtotalLabel,
            style: boldStyle,
          ),
          Text(
            details.subtotal.toStringAsFixed(2),
            style: boldStyle,
          ),
        ]),
        const SizedBox(
          height: primaryPadding / 2,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            deliveryFeeLabel,
            style: smallStyle,
          ),
          Text(
            details.deliveryFee.toStringAsFixed(2),
            style: smallStyle,
          ),
        ]),
        const SizedBox(
          height: primaryPadding / 2,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            discountLabel,
            style: smallStyle,
          ),
          Text(
            details.discount.toStringAsFixed(2),
            style: smallStyle,
          ),
        ]),
        const Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            totalLabel,
            style: boldStyle,
          ),
          Text(
            details.total.toStringAsFixed(2),
            style: boldStyle,
          ),
        ]),
      ]),
    );
  }
}
