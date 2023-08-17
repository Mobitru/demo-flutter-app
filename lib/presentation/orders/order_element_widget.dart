import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/order.dart';

class OrderElementWidget extends StatelessWidget {
  const OrderElementWidget(
    this.order, {
    super.key,
    required this.onTap,
    this.inProgress = false,
    this.isLast = false,
  });

  final ValueChanged<ProductOrder> onTap;
  final ProductOrder order;
  final bool inProgress;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(order),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        inProgress
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: const BoxDecoration(
                  color: greenFontColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  inProgressLabel,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                ),
              )
            : const SizedBox(
                height: primaryPadding / 2,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$orderLabel${order.id}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5, color: Colors.black),
            ),
            Text(
              '\$ ${order.paymentDetails.total.toStringAsFixed(2)}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(height: 1.5, color: Colors.black),
            )
          ],
        ),
        Column(
          children: order.products
              .map((productInfo) => Row(
                    children: [
                      Expanded(
                        child: Text(
                          productInfo.product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300, height: 1.5, color: Colors.black),
                        ),
                      ),
                      if (productInfo.quantity > 1)
                        SizedBox(
                          width: 20,
                          child: Text(
                            'x${productInfo.quantity}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w300, height: 1.5, color: Colors.black),
                          ),
                        )
                    ],
                  ))
              .toList(),
        ),
        SizedBox(
          height: isLast ? primaryPadding : primaryPadding / 2,
        ),
        if (!isLast) const Divider(),
      ]),
    );
  }
}
