import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';

class GreyLineWidget extends StatelessWidget {
  final String text;

  const GreyLineWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 47,
        width: double.infinity,
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.only(left: primaryPadding, top: primaryPadding),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.3),
          ),
        ),
      );
}
