import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:flutter_demo_app/presentation/order_details/order_details_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  final ProductOrder order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(context, '$orderLabel${order.id}'),
        backgroundColor: Colors.white,
        body: OrdersDetailsWidget(
          order: order,
        ),
      ),
    );
  }
}
