import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/account/edit_account_widget.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:provider/provider.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({
    super.key,
  });

  @override
  EditAccountState createState() => EditAccountState();
}

class EditAccountState extends State<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authState, child) {
      return SafeArea(
        child: Scaffold(
          appBar: getAppBar(context, editAccountLabel),
          body: EditAccountWidget(
            user: authState.currentUser!,
            callback: authState.updateCurrentUser,
          ),
        ),
      );
    });
  }
}
