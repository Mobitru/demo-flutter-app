import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/cart/cart_widget.dart';
import 'package:flutter_demo_app/presentation/cart/empty_cart_widget.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:flutter_demo_app/presentation/order_details/order_review_page.dart';
import 'package:flutter_demo_app/state/cart_state.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(context, myCartLabel),
          body: state.products.isEmpty
              ? const EmptyCartWidget()
              : CartWidget(
                  products: state.products,
                  remove: state.addOrRemoveToCart,
                  discountCode: state.discountCode,
                  removeDiscount: state.updateDiscount,
                  processOrder: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const OrderReviewPage();
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
