import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/l10n/app_localizations.dart';
import 'package:flutter_demo_app/presentation/login/error_widget.dart';
import 'package:flutter_demo_app/presentation/common/input_widget.dart';
import 'package:flutter_demo_app/presentation/common/logo_widget.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:provider/provider.dart';
import 'dart:ffi' as ffi;

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
                Text(
                  AppLocalizations.of(context)!.loginDescriptionText,
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
                if (widget.showError) ErrorPanelWidget(AppLocalizations.of(context)!.loginErrorMessage),
                InputWidget(AppLocalizations.of(context)!.loginTextFieldTitle, controller: loginTextController),
                InputWidget(AppLocalizations.of(context)!.passwordTextFieldTitle,
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
                  child: Text(
                    AppLocalizations.of(context)!.loginButtonTitle,
                    style:
                        TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: primaryPadding,
                ),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, primaryPadding * 3)),
                  onPressed: () {
                      setState(() {
                        loginTextController.clear();                        
                        passwordTextController.clear();                                                                         
                      });                
                      context.read<AuthState>().authWithCorrectUser();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.typeCredsAndLoginButtonTitle,
                    style:
                        TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: primaryPadding * 2,
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
                    onPressed: () => context.read<AuthState>().checkBioAuth(context),
                    child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                      Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                      ),
                      Text(AppLocalizations.of(context)!.biometricButtonTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))
                    ]),
                  ),
                const SizedBox(
                  height: primaryPadding * 8,
                ),                  
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.orangeAccent,
                    minimumSize: const Size(
                      double.infinity,
                      primaryPadding * 3,
                    ),
                  ),
                  onPressed: () {
                    // This will cause a segmentation fault and crash the app
                    ffi.Pointer<ffi.Int32>.fromAddress(0).value = 1;
                  },
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.crashButtonTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
