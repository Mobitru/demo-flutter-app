import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final double fontSize;
  final String? discountedPrice;

  const PriceWidget({
    super.key,
    required this.price,
    required this.discountedPrice,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) => discountedPrice != null
      ? RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: '\$ $discountedPrice',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              height: 1.3,
              color: redFontColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\$ $price',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        )
      : Text(
          '\$ $price',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        );
}
