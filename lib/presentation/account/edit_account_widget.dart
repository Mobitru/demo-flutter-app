import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/model/user.dart';
import 'package:flutter_demo_app/presentation/common/bottom_widget.dart';
import 'package:flutter_demo_app/presentation/common/button_widget.dart';
import 'package:flutter_demo_app/presentation/common/input_widget.dart';

class EditAccountWidget extends StatefulWidget {
  final User user;
  final ValueChanged<User> callback;
  final bool addressCheck;

  const EditAccountWidget({
    super.key,
    required this.user,
    required this.callback,
    this.addressCheck = false,
  });

  @override
  EditAccountState createState() => EditAccountState();
}

class EditAccountState extends State<EditAccountWidget> {
  late final TextEditingController firstNameTextController;
  late final TextEditingController lastNameTextController;
  late final TextEditingController addressTextController;
  late final TextEditingController emailTextController;

  var isFirstNameEmpty = false;
  var isLastNameEmpty = false;
  var isAddressEmpty = false;

  @override
  void initState() {
    super.initState();
    firstNameTextController = TextEditingController(text: widget.user.firstName);
    lastNameTextController = TextEditingController(text: widget.user.lastName);
    addressTextController = TextEditingController(text: widget.user.address);
    emailTextController = TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (_, orientation) => TopWidget(
          scrollable:
              orientation == Orientation.landscape || MediaQuery.of(context).devicePixelRatio > 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: primaryPadding,
            ),
            child: Column(
              children: [
                Text(
                  widget.addressCheck ? editAddressDescription : editAccountDescription,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w300, height: 1.5),
                ),
                const SizedBox(
                  height: primaryPadding,
                ),
                InputWidget(
                  firstNameTextFieldTitle,
                  controller: firstNameTextController,
                  error: isFirstNameEmpty,
                ),
                InputWidget(
                  lastNameTextFieldTitle,
                  controller: lastNameTextController,
                  error: isLastNameEmpty,
                ),
                InputWidget(
                  emailTextFieldTitle,
                  readOnly: true,
                  controller: emailTextController,
                ),
                InputWidget(
                  addressTextFieldTitle,
                  controller: addressTextController,
                  error: isAddressEmpty,
                ),
                BottomWidget(
                    expanded: orientation == Orientation.portrait &&
                        MediaQuery.of(context).devicePixelRatio <= 3,
                    child: ButtonWidget(
                      size: const Size(double.infinity, primaryPadding * 3),
                      color: primaryColor,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      title: widget.addressCheck ? reviewOrderButtonTitle : saveButtonTitle,
                      padding: const EdgeInsets.symmetric(vertical: primaryPadding),
                      callback: () {
                        isAddressEmpty = addressTextController.text.isEmpty;
                        isLastNameEmpty = lastNameTextController.text.isEmpty;
                        isFirstNameEmpty = firstNameTextController.text.isEmpty;

                        if (isAddressEmpty || isLastNameEmpty || isFirstNameEmpty) {
                          setState(() {});
                          return;
                        }

                        widget.callback(
                          User(
                            email: emailTextController.text,
                            lastName: lastNameTextController.text,
                            firstName: firstNameTextController.text,
                            address: addressTextController.text,
                          ),
                        );
                        if (!widget.addressCheck) Navigator.of(context).pop();
                      },
                    ))
              ],
            ),
          ),
        ),
      );

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    addressTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }
}
