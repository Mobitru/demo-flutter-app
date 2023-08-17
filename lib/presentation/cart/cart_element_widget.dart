import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/values.dart';
import 'package:flutter_demo_app/model/product.dart';
import 'package:flutter_demo_app/presentation/cart/circle_button.dart';
import 'package:flutter_demo_app/presentation/products/price_widget.dart';

class CartElementWidget extends StatelessWidget {
  const CartElementWidget(
    this.product, {
    super.key,
    required this.onTap,
    required this.isDiscounted,
  });

  final ValueChanged<MapEntry<Product, int>> onTap;
  final MapEntry<Product, int> product;
  final bool isDiscounted;
  final maxNumber = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: primaryPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              '$productsImagesUri${product.key.image}.png',
              height: 100,
            ),
            const SizedBox(
              width: primaryPadding,
            ),
            Expanded(
              child: Text(
                product.key.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w300, height: 1.5),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CircleButton(
              icon: product.value > 1 ? Icons.remove : CupertinoIcons.trash,
              onTap: () => onTap(MapEntry(product.key, product.value - 1)),
              elementId: product.value > 1 ? 'minusButton' : 'removeButton',
            ),
            const SizedBox(
              width: primaryPadding,
            ),
            Container(
              width: 69,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text(
                product.value.toString(),
              ),
            ),
            const SizedBox(
              width: primaryPadding,
            ),
            CircleButton(
              disabled: product.value >= maxNumber,
              icon: CupertinoIcons.add,
              onTap: () => onTap(MapEntry(product.key, product.value + 1)),
              elementId: 'plusButton',
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isDiscounted || product.key.discountValue != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        isDiscounted ? '${qrCodeDiscount.toString()}%' : product.key.discountValue!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  PriceWidget(
                      fontSize: 16,
                      price: product.key.price.toString(),
                      discountedPrice: (isDiscounted
                              ? (product.key.price * (100 - qrCodeDiscount) / 100)
                              : product.key.discountPrice)
                          ?.toString()),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ]),
    );
  }
}
