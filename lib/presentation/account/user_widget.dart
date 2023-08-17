import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/model/user.dart';

class UserWidget extends StatelessWidget {
  final User user;
  final VoidCallback? callback;
  final double titleSize;
  final double usualSize;

  const UserWidget({
    super.key,
    required this.titleSize,
    required this.usualSize,
    required this.user,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final usualStyle = TextStyle(
      fontSize: usualSize,
      fontWeight: FontWeight.w300,
      color: Colors.black,
      height: 1.7,
    );

    final titleStyle = TextStyle(
      fontSize: titleSize,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.7,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: primaryPadding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: titleStyle,
                overflow: TextOverflow.clip,
              ),
              Text(
                user.email,
                style: usualStyle,
                overflow: TextOverflow.clip,
              ),
              Text(
                user.address,
                style: usualStyle,
                overflow: TextOverflow.clip,
              ),
            ]),
            if (callback != null)
              IconButton(onPressed: callback, icon: const Icon(Icons.edit_outlined)),
          ]),
    );
  }
}
