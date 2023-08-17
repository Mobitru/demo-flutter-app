import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  static const detailsStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.5, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_basket_outlined,
            color: Colors.grey,
          ),
          Text(
            cartIsEmptyLabel,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey, height: 1.5),
          ),
          const Text(
            cartIsEmptyLabelDetails1,
            style: detailsStyle,
          ),
          const Text(
            cartIsEmptyLabelDetails2,
            style: detailsStyle,
          ),
          const SizedBox(
            height: 36,
          ),
          ButtonWidget(
            size: const Size(150, primaryPadding * 3),
            callback: () => Navigator.of(context).pop(),
            title: viewProductsButtonTitle,
            color: primaryColor,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, height: 1.5),
          )
        ],
      ),
    );
  }
}
