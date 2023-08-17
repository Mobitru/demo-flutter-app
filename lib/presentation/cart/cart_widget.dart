import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/presentation/cart/cart_element_widget.dart';
import 'package:flutter_demo_app/presentation/cart/discount_code_widget.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:flutter_demo_app/presentation/common/padding.dart';
import 'package:flutter_demo_app/presentation/qr_scanner/qr_scanner.dart';

class CartWidget extends StatelessWidget {
  final Map<Product, int> products;
  final ValueChanged<MapEntry<Product, int>> remove;
  final String discountCode;
  final VoidCallback removeDiscount;
  final VoidCallback processOrder;

  const CartWidget({
    super.key,
    required this.products,
    required this.remove,
    required this.discountCode,
    required this.removeDiscount,
    required this.processOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: secondaryPadding),
          child: discountCode.isEmpty
              ? DefaultPaddingWidget(
                  child: ButtonWidget(
                    size: const Size(double.infinity, primaryPadding * 3),
                    callback: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const QrScanner();
                        },
                      ),
                    ),
                    title: applyPromoCodeButtonTitle,
                    color: Colors.white,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black, height: 1.5),
                  ),
                )
              : DiscountCodeWidget(
                  discountCode: discountCode,
                  remove: removeDiscount,
                ),
        ),
        ...products.entries
            .map(
              (product) => DefaultPaddingWidget(
                child: CartElementWidget(
                  product,
                  onTap: remove,
                  isDiscounted: discountCode.isNotEmpty,
                ),
              ),
            )
            .toList(),
        const SizedBox(height: primaryPadding * 3 ,)
      ]),
      Positioned(
        bottom: secondaryPadding,
        child: DefaultPaddingWidget(
          child: ButtonWidget(
            size: Size(MediaQuery.of(context).size.width - primaryPadding * 2, primaryPadding * 3),
            callback: processOrder,
            title: continueToCheckoutButtonTitle,
            color: primaryColor,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, height: 1.5),
          ),
        ),
      ),
    ]);
  }
}
