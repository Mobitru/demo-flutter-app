# Contributing to the app

You can add new functionality to the app by following the instructions below.

## Table of contents

1. [Set up development environment](#set-up-development-environment)
1. [SemanticsLabels](#semanticslabels)
1. [Building the app from the Terminal or Console](#building-the-app-from-the-terminal-or-console)
1. [Running Appium tests on a local machine in the CLI](#running-appium-tests-on-a-local-machine-in-the-cli)
1. [Running Appium tests with the Mobitru](#running-appium-tests-with-the-mobitru)
1. [Libraries used](#libraries-used)

## Set up development environment

- install flutter: https://docs.flutter.dev/get-started/install.
- run `flutter doctor` after and install all missing dependencies like Android SDK.
- add Google Pixel 5 or 6 virtual device: https://developer.android.com/studio/run/managing-avds.
- install [simulator](https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes) for installed iOS SDK.


## SemanticsLabels
Add unique `semanticsLabel` for all elements with such property because it allows the Appium to recognize such elements by this value.
Here is an example:
```dart
       Text(
            ...
            semanticsLabel: title,
            ...
        ),
```

## Building the app from the Terminal or Console
> In the case of iOS, please make sure that Development Team is selected on the Signing & Capabilities pane of the project editor

> More details can be found [here](https://docs.flutter.dev/deployment/ios#review-xcode-project-settings)

- go to the project root directory in CLI.
- perform `flutter build apk --debug` in case of Android or `flutter build ipa --release` for iOS.
- wait for all dependencies will be downloaded and assembling will be finished.

> The output file will be available in `build/app/outputs/flutter-apk/` or `build/ios/ipa/` directories

## Running Appium tests on a local machine in the CLI

> Make sure you've connected to a Device or Emulator via ADB

- build an apk file for Android.
- start the Appium server in Console or Terminal.
- go to ```tests/functional/``` directory in additional Console or Terminal window.
- run tests with the command ```mvn clean test -PlocalAndroid -Ddevice.name="<emulator device name>" -Dplatform.version="<emulator platform version>" -Dapp.file="<absolute path to apk file>"```.

> The App will be installed automatically.
> Tests execution will be started after that.

## Running Appium tests with the Mobitru
> In the case of iOS, please make sure that Development Team is selected on the Signing & Capabilities pane of the project editor

> More details can be found [here](https://docs.flutter.dev/deployment/ios#review-xcode-project-settings)

- build an app file for Android or iOS
- generate an [Access Key](https://docs.mobitru.com/access-key/)
- go to ```tests/functional/``` directory in additional Console or Terminal window
- run tests with the command ```mvn clean test -PremoteAndroid -Dapp.file="<absolute path to apk file>" -Dapi.key=<generated access key> -Ddevice.udid="<device udid>" -Dproject.name=<bulling unit name or personal keyword>```

> The App will be uploaded and installed automatically on specified Device.
> Tests execution will be started after that.


## Libraries used

Runtime dependencies:

* cupertino_icons: ^1.0.2
* freezed: ^2.3.2
* get_it: ^7.2.0
* go_router: ^6.0.1
* injectable: ^2.1.0
* json_annotation: ^4.7.0
* local_auth: ^2.1.3
* provider: ^6.0.5
* webview_flutter: ^4.0.2
* mobile_scanner: ^2.1.0

Compile time dependencies:
* build_runner: ^2.3.3
* flutter_launcher_icons: ^0.12.0
* flutter_lints: ^2.0.0
* freezed_annotation: ^2.2.0
* injectable_generator: ^2.1.3
* json_serializable: ^6.5.4
