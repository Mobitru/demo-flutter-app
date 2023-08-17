import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/user.dart';
import 'package:flutter_demo_app/presentation/account/user_widget.dart';
import 'package:flutter_demo_app/presentation/common/bottom_widget.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  final User? user;
  final VoidCallback logout;
  final VoidCallback edit;

  const AccountPage({
    required this.user,
    required this.logout,
    required this.edit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final usr = user;

    return OrientationBuilder(
      builder: (_, orientation) => TopWidget(
        scrollable: orientation == Orientation.landscape,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (usr != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: primaryPadding,
              ),
              child: UserWidget(
                titleSize: 20,
                usualSize: 16,
                user: usr,
                callback: edit,
              ),
            ),
          Container(
              color: Colors.grey,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  left: primaryPadding, top: primaryPadding, bottom: primaryPadding / 2),
              child: Text(
                generalLabel,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          InkWell(
            onTap: () => context.go('/$appNavigationAbout'),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: primaryPadding, top: primaryPadding, bottom: primaryPadding),
              child: Text(
                aboutButtonTitle,
                style:
                    Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
          ),
          BottomWidget(
              expanded: orientation == Orientation.portrait,
              child: ButtonWidget(
                padding: const EdgeInsets.all(primaryPadding),
                size: const Size(double.infinity, primaryPadding * 3),
                title: logoutButtonTitle,
                color: logoutButtonColor,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                callback: logout,
              )),
        ]),
      ),
    );
  }
}
