import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool readOnly;
  final bool obscureText;
  final bool error;

  const InputWidget(
    this.title, {
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.error = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            semanticsLabel: title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: primaryPadding * 3,
            child: TextField(
              readOnly: readOnly,                          
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                errorText: error ? 'Field can\'t be empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      );
}
