import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/account/edit_account_widget.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:flutter_demo_app/presentation/order_details/order_details_widget.dart';
import 'package:flutter_demo_app/presentation/order_details/success_order_widget.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:flutter_demo_app/state/cart_state.dart';
import 'package:provider/provider.dart';

class OrderReviewPage extends StatefulWidget {
  const OrderReviewPage({
    super.key,
  });

  @override
  OrderReviewPageState createState() => OrderReviewPageState();
}

class OrderReviewPageState extends State<OrderReviewPage> {
  var isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartState, AuthState>(builder: (context, cartState, authState, child) {
      return SafeArea(
        child: Scaffold(
          appBar: getAppBar(
              context,
              isSuccess
                  ? orderCompletedLabel
                  : authState.currentUser!.address.isNotEmpty
                      ? reviewOrderLabel
                      : provideAddressLabel),
          backgroundColor: Colors.white,
          body: isSuccess
              ? const SuccessOrderWidget()
              : authState.currentUser!.address.isNotEmpty
                  ? OrdersDetailsWidget(
                      order: cartState.generateOrder(),
                      processOrder: true,
                      success: (order) => setState(() {
                        isSuccess = true;
                        cartState.processOrder(order);
                      }),
                    )
                  : EditAccountWidget(
                      user: authState.currentUser!,
                      callback: authState.updateCurrentUser,
                      addressCheck: true,
                    ),
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isSuccess = false;
  }
}
