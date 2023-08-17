import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/presentation/common/padding.dart';

class ErrorPanelWidget extends StatelessWidget {
  final String message;

  const ErrorPanelWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: primaryPadding * 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: errorBackgroundColor,
        ),
        child: DefaultPaddingWidget(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              const Icon(Icons.cancel_outlined, color: redFontColor),
              const SizedBox(width: 10),
              Text(
                message,
                textAlign: TextAlign.start,
                semanticsLabel: 'errorMessage',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: redFontColor,
                ),
              )
            ]),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: redFontColor),
            )
          ]),
        ),
      );
}
