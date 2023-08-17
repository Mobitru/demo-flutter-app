import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final String title;
  final Color color;
  final Size size;
  final TextStyle? style;
  final VoidCallback callback;

  const ButtonWidget({
    required this.size,
    required this.callback,
    required this.title,
    required this.color,
    required this.style,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: color,
        minimumSize: size,
      ),
      onPressed: callback,
      child: Text(
        title,
        style: style,
      ),
    );

    final pad = padding;

    return pad != null
        ? Padding(
            padding: pad,
            child: button,
          )
        : button;
  }
}
