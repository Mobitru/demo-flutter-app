import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/login/error_widget.dart';
import 'package:flutter_demo_app/presentation/common/input_widget.dart';
import 'package:flutter_demo_app/presentation/common/logo_widget.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final bool showError;
  final bool showBiometric;

  const LoginPage({
    this.showError = false,
    this.showBiometric = false,
    super.key,
  });

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: primaryPadding,
            ),
            child: Column(
              children: [
                const LogoWidget(),
                const Text(
                  loginDescriptionText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: primaryPadding * 2,
                ),
                if (widget.showError) const ErrorPanelWidget(loginErrorMessage),
                InputWidget(loginTextFieldTitle, controller: loginTextController),
                InputWidget(passwordTextFieldTitle,
                    controller: passwordTextController, obscureText: true),
                const SizedBox(
                  height: primaryPadding * 2,
                ),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, primaryPadding * 3)),
                  onPressed: () => context.read<AuthState>().checkAuth(
                      email: loginTextController.value.text,
                      password: passwordTextController.value.text),
                  child: const Text(
                    loginButtonTitle,
                    style:
                        TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: primaryPadding,
                ),
                if (widget.showBiometric)
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, primaryPadding * 3),
                    ),
                    onPressed: () => context.read<AuthState>().checkBioAuth(),
                    child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: const [
                      Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                      ),
                      Text(biometricButtonTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))
                    ]),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
