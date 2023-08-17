import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';

class DiscountCodeWidget extends StatelessWidget {
  final VoidCallback remove;
  final String discountCode;

  const DiscountCodeWidget({
    super.key,
    required this.remove,
    required this.discountCode,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 72,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: primaryPadding),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - (primaryPadding * 2 + 36),
                child: Text(
                  '$discountCode $discountAppliedLabel',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: greenFontColor, height: 1.5),
                ),
              ),
            ),
            IconButton(
              onPressed: remove,
              icon: const Icon(CupertinoIcons.trash),
            ),
          ],
        ),
      );
}
