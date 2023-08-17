import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo_app/consts/accessibility.dart';
import 'package:flutter_demo_app/consts/sizes.dart';

class PercentWidget extends StatelessWidget {
  final Widget child;
  final String? percents;
  final SemanticsSortKey sortKey;

  const PercentWidget({
    super.key,
    required this.child,
    required this.percents,
    required this.sortKey,
  });

  @override
  Widget build(BuildContext context) {
    var value = percents;
    return value != null
        ? Stack(
            children: [
              child,
              Positioned(
                left: primaryPadding,
                bottom: primaryPadding / 4,
                child: Semantics(
                  label: accessibilityDiscountLabel,
                  sortKey: sortKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          )
        : child;
  }
}
