import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/presentation/orders/order_element_widget.dart';

class CurrentOrderWidget extends StatelessWidget {
  final ProductOrder currentOrder;
  final ValueChanged<ProductOrder> onTap;

  const CurrentOrderWidget({super.key, required this.currentOrder, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 47,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: primaryPadding, top: primaryPadding),
              child: Text(
                '$inProgressLabel (1)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: primaryPadding, vertical: primaryPadding / 2),
            child: OrderElementWidget(
              currentOrder,
              onTap: onTap,
              inProgress: true,
              isLast: true,
            ),
          )
        ],
      ),
    );
  }
}
