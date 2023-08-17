import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:go_router/go_router.dart';

class SuccessOrderWidget extends StatelessWidget {

  const SuccessOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.check,
                size: 45,
                color: greenFontColor,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 320,
                child: Text(
                  successLabel,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey, height: 1.3, fontWeight: FontWeight.w300),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(primaryPadding),
          child: ButtonWidget(
            size: const Size(double.infinity, primaryPadding * 3),
            callback: () {
              context.go('/');
            },
            title: goBackButtonTitle,
            color: primaryColor,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, height: 1.5),
          ),
        ),
      ],
    );
  }
}
