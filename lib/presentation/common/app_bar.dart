import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context, String text) => AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.black, height: 1.3),
      ),
    );
