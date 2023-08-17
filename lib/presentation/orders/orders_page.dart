import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/presentation/common/grey_line.dart';
import 'package:flutter_demo_app/presentation/order_details/order_details_page.dart';
import 'package:flutter_demo_app/presentation/orders/current_order_widget.dart';
import 'package:flutter_demo_app/presentation/orders/order_element_widget.dart';

class OrdersPage extends StatelessWidget {
  final List<ProductOrder> orders;
  final ProductOrder? currentOrder;

  const OrdersPage({super.key, required this.orders, this.currentOrder});

  @override
  Widget build(BuildContext context) {
    var current = currentOrder;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (current != null)
            CurrentOrderWidget(
              currentOrder: current,
              onTap: (order) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return OrderDetailsPage(order: order);
                  },
                ),
              ),
            ),
          GreyLineWidget(
            text: '$completedLabel (${orders.length})',
          ),
          ...orders
              .map((order) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: primaryPadding, vertical: primaryPadding / 2),
                    child: OrderElementWidget(
                      order,
                      onTap: (order) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return OrderDetailsPage(order: order);
                          },
                        ),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
