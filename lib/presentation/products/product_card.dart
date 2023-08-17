import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo_app/consts/accessibility.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/consts/values.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:flutter_demo_app/presentation/common/padding.dart';
import 'package:flutter_demo_app/presentation/products/percent_widget.dart';
import 'package:flutter_demo_app/presentation/products/price_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.product, {
    super.key,
    required this.onTap,
    required this.isBooked,
    required this.semanticsIndex,
  });

  final int semanticsIndex;
  final VoidCallback onTap;
  final Product product;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return DefaultPaddingWidget(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PercentWidget(
              sortKey: OrdinalSortKey(semanticsIndex * productSemanticsNumber + 2),
              percents: product.discountValue,
              child: Semantics(
                label: accessibilityPhoneImageLabel,
                sortKey: OrdinalSortKey(semanticsIndex * productSemanticsNumber.toDouble()),
                child: Image.asset(
                  '$productsImagesUri${product.image}.png',
                  height: constrains.maxHeight * 0.5,
                ),
              ),
            ),
            Semantics(
              sortKey: OrdinalSortKey(semanticsIndex * productSemanticsNumber + 3),
              label: '$accessibilityPriceLabel ${product.discountPrice ?? product.price}\$ '
                  '${product.discountPrice != null ? '$accessibilityPriceBeforeDiscount ${product.price}\$' : ''}',
              child: ExcludeSemantics(
                child: PriceWidget(
                  fontSize: 18,
                  price: product.price.toString(),
                  discountedPrice: product.discountPrice?.toString(),
                ),
              ),
            ),
            SizedBox(
              height: 42,
              child: Semantics(
                sortKey: OrdinalSortKey(semanticsIndex * productSemanticsNumber + 1),
                child: Text(
                  product.name,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Semantics(
                sortKey: OrdinalSortKey(semanticsIndex * productSemanticsNumber + 4),
                child: ButtonWidget(
                  size: Size(constrains.maxWidth - primaryPadding * 2, primaryPadding * 2),
                  callback: onTap,
                  title: isBooked ? addedToCartButtonTitle : addToCartButtonTitle,
                  color: isBooked ? Colors.white : primaryColor,
                  style: TextStyle(
                      color: isBooked ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
          ]),
        );
      },
    );
  }
}
