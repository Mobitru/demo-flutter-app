import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool disabled;
  final String elementId;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.elementId,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final container = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: disabled ? Colors.black12 : null,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Icon(
        icon,
        size: 18,
        color: disabled ? Colors.grey : null,
        semanticLabel: elementId,
      ),
    );

    return disabled
        ? container
        : InkWell(
            onTap: onTap,
            child: container,
          );
  }
}
