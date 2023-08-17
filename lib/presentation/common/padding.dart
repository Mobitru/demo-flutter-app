import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';

class DefaultPaddingWidget extends StatelessWidget {
  final Widget child;

  const DefaultPaddingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: primaryPadding),
        child: child,
      );
}
