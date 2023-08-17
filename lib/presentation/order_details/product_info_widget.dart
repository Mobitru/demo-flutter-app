import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/product_info.dart';
import 'package:flutter_demo_app/presentation/products/price_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget(
    this.info, {
    super.key,
    this.isLast = false,
  });

  final ProductInfo info;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: primaryPadding,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            '$productsImagesUri${info.product.image}.png',
            height: 56,
            semanticLabel: 'productImage',
          ),
          const SizedBox(
            width: primaryPadding,
          ),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                info.product.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceWidget(
                      price: info.product.price.toString(),
                      discountedPrice: info.product.discountPrice?.toString(),
                      fontSize: 16),
                  if (info.product.discountPrice != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        info.product.discountValue!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  Text('$quantityLabel${info.quantity}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w300, height: 1.5, color: Colors.grey),
),
                ],
              ),
            ]),
          )
        ],
      ),
      SizedBox(
        height: isLast ? primaryPadding : primaryPadding / 2,
      ),
      if (!isLast) const Divider(),
    ]);
  }
}
