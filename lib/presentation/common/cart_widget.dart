import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/accessibility.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';

class ProductCartWidget extends StatelessWidget {
  final int amount;
  final VoidCallback callback;

  const ProductCartWidget({required this.amount, required this.callback, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: callback,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: cartBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: primaryPadding / 4,
              horizontal: primaryPadding / 2,
            ),
            child: Semantics(
              label: '$amount $accessibilityCartButton',
              excludeSemantics: true,
              child: Text(
                '$cartLabel($amount)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.black, height: 1.3),
              ),
            ),
          ),
        ),
      );
}
