# Automation

## Table of contents
1. [Intro](#intro)
1. [Set up test development environment](#set-up-test-development-environment)
1. [Writing tests](#writing-tests)
1. [Running tests on a local machine with an emulator](#running-tests-on-a-local-machine-with-an-emulator)
1. [Running tests in the Mobitru](#running-tests-in-the-mobitru)
    1. [The setup](#the-setup)
    1. [Running tests](#running-tests)


## Intro
Tests are run with:

* [TestNg](https://testng.org/doc/): The Test Framework that is used to write and organize the tests
* [Appium](https://appium.io/docs/en/2.0/): The Framework for operate with mobile devices and facilitate UI automation on them.
* [Maven](https://testng.org/doc//): This is the tool for building and running the tests

## Set up test development environment

- install [JDK 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
- install [Maven](https://maven.apache.org/install.html).
- setup [IntelliJ IDEA](https://www.jetbrains.com/help/idea/installation-guide.html).
- install [Appium](https://github.com/appium/appium) with `npm i --location=global appium`
- install [Android Studio](https://developer.android.com/studio/#downloads)
- setup [Android 13 SDK](https://developer.android.com/about/versions/13/setup-sdk)
- add Google Pixel 5 or 6 [virtual device](https://developer.android.com/studio/run/managing-avds)
- install iOS14+ SDK
- install [simulator](https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes) for selected SDK.

## Writing tests
You can find the current tests in [this](../tests/functional/src/test/java/com/mobitru/tests/SmokeNativeTests.java)-class to see how the tests are being written.

All of them are grouped according to functionality and have priority, impacting execution order.
More information you can find on [this](https://testng.org/doc/documentation-main.html#test-groups) site.

The main logic is covered in Screen classes, which can be found [here](../tests/functional/src/test/java/com/mobitru/screen/). 
The Implementation is based on PageOject pattern, when every Class contains fields related to UI Elements and methods, related to UI Actions.
More information you can find in [this](https://github.com/appium/java-client/blob/master/docs/Page-objects.md) site.

### Working with elements
For finding elements, you can use XPATH locators or CSS selectors.
Unfortunately, it's not possible to specify a Test ID for every element due to existing [issue](https://github.com/flutter/flutter/issues/17988), but you build a Locator using ```semanticsLabel``` value, which can be found inside the App source code.

More information can be found in [here](https://api.flutter.dev/flutter/widgets/Text/semanticsLabel.html).

## Running tests on a local machine with an emulator
> Make sure you've connected to a Device or Emulator via ADB

- build an apk file for Android
- start the Appium server in Console or Terminal
- go to ```tests/functional/``` directory in additional Console or Terminal window
- run tests with the command ```mvn clean test -PlocalAndroid -Ddevice.name="<emulator device name>" -Dplatform.version="<emulator platform version>" -Dapp.file="<absolute path to apk file>"```

> The App will be installed automatically.
> Tests execution will be started after that.

## Running tests in the Mobitru

### The setup
The setup includes building an apk or ipa file with the App.
Also, you need to generate an [Access Key](https://docs.mobitru.com/access-key/)

### Running tests
- go to ```tests/functional/``` directory in additional Console or Terminal window
- run tests with the command ```mvn clean test -PremoteAndroid -Dapp.file="<absolute path to apk file>" -Dapi.key=<generated access key> -Ddevice.udid="<device udid>" -Dproject.name=<bulling unit name or personal keyword>```

> The App will be uploaded and installed automatically on specified Device.
> Tests execution will be started after that.
