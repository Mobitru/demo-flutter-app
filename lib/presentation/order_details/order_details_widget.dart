import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/order.dart';
import 'package:flutter_demo_app/presentation/account/user_widget.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:flutter_demo_app/presentation/common/grey_line.dart';
import 'package:flutter_demo_app/presentation/common/padding.dart';
import 'package:flutter_demo_app/presentation/order_details/payment_details_widget.dart';
import 'package:flutter_demo_app/presentation/order_details/product_info_widget.dart';

class OrdersDetailsWidget extends StatelessWidget {
  final ProductOrder order;
  final bool processOrder;
  final ValueSetter<ProductOrder>? success;

  const OrdersDetailsWidget({
    super.key,
    required this.order,
    this.processOrder = false,
    this.success,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...order.products.map(
            (info) => DefaultPaddingWidget(
              child: ProductInfoWidget(
                info,
                isLast: order.products.indexOf(info) == order.products.length - 1,
              ),
            ),
          ),
          const GreyLineWidget(
            text: contactDetailsLabel,
          ),
          DefaultPaddingWidget(
            child: UserWidget(
              user: order.user,
              titleSize: 14,
              usualSize: 14,
            ),
          ),
          const GreyLineWidget(
            text: paymentDetailsLabel,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: primaryPadding, vertical: primaryPadding),
            child: PaymentDetailsWidget(details: order.paymentDetails),
          ),
          if (processOrder && success != null)
            ButtonWidget(
                padding: const EdgeInsets.all(primaryPadding),
                size: const Size(double.infinity, primaryPadding * 3),
                callback: () => success!(order),
                title: confirmOrderLabel,
                color: primaryColor,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}
