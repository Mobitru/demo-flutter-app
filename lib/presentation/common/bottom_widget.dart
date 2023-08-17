import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final bool expanded;
  final Widget child;

  const BottomWidget({
    required this.expanded,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => expanded
      ? Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        )
      : child;
}

class TopWidget extends StatelessWidget {
  final bool scrollable;
  final Widget child;

  const TopWidget({
    required this.scrollable,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => scrollable ? SingleChildScrollView(child: child) : child;
}
