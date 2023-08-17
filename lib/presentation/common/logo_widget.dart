import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/assets.dart';
import 'package:flutter_demo_app/consts/sizes.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: primaryPadding),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            logoUri,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      );
}
