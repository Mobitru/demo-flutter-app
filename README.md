# Mobitru Flutter Demo Application

In this repository, you will find our Mobitru Flutter demo App.
You can use it as a demo App for test automation or manual practice on your local machine or on the Real Device Platform.

![mobitru.order](./docs/assets/mobitru_overview.gif)

## Table of contents
1. [Functionalities](#functionalities)
    1. [UI Controls](#ui-controls)
    1. [Biometric authentication](#biometric-authentication)
    1. [UI Layouts](#ui-layouts)
    1. [Event Handling](#event-handling)
    1. [QR code scanner](#qr-code-scanner)
    1. [Accessibility](#accessibility)
1. [Contributing to the App](#contributing-to-the-app)
1. [Test automation](#test-automation)
    1. [Appium](#appium)
1. [FAQ](#faq)

## Functionalities

### UI Controls
This app contains variations of the most useful UI widgets like:
- Text
- Input
- Button
- Image
- Icon
- BottomNavigationBar

More details about Flutter UI controls can be found [here](https://docs.flutter.dev/ui/widgets).

You can find autotests for all kinds of controls [here](tests/functional/src/test/java/com/mobitru/tests/SmokeNativeTests.java), for example:
- **loginValidCredential** - enter data to EditText, Password Input, and click on Button 
- **editMyAccountInfoUsingCorrectValues** - work with BottomNavigationBar, replace data in Input, and read info from Text
- **checkOpenCartAfterAddProduct** - click on Button, verify data in Text, and check Image

### Biometric authentication
This app supports Biometric authentication on the Login Screen.

You only need to enable it on your Device, and then you will be able to log in without entering credentials.

Just open the Login Screen **->** tap the 'Biometric authentication' button **->** complete identity verification.

> You can find more details on how to do this on Mobitru [here](https://docs.mobitru.com/biometric-authentication/).

### UI Layouts
This app also has various UI interface layouts, which are related to significant groups of elements, like
- Container
- List
- Row
- CustomScrollView
- SliverGrid

More details about Flutter UI View layout can be found [here](https://docs.flutter.dev/ui/layout/lists).

You can find autotests for all kinds of layouts [here](tests/functional/src/test/java/com/mobitru/tests/SmokeNativeTests.java), for example:
- **checkProductItemElements** - check elements in a List
- **checkMyAccountViewElement** - verify text data on a Container
- **checkInfoOnReviewOrderScreen** - validate elements on a Row and a CustomScrollView

### Event Handling
Different kinds of User Actions are available in the App, for example:
- add or remove from the cart
- change the product number
- validate user info fields
- sort a list of products

A lot of them are covered by using the specific States.
More details can be found [here](https://docs.flutter.dev/ui/interactivity).

You can find autotests for all kinds of actions [here](tests/functional/src/test/java/com/mobitru/tests/SmokeNativeTests.java), for example:
- **checkAddToCart** and **checkRemoveFromCart** - add/remove products from the cart and check the total number
- **checkSortPriceDescending** and **checkSortPriceAscending** - change sorting and verify updated a Products List
- **completeOrder** - add a product to the cart, enter user info, and complete the Order

### QR code scanner

You can also scan a QR code in the Mobitru demo app.

Just add several items to the cart and activate The QR Code scanning on the Cart screen:
- tap on the 'Apply promo code' button.
- allow the app to use the camera (needed for the first usage only).
- scan a QR code.

As a result, you will see related content (like URL) on the Cart Screen, and a random discount will be applied to any item in the Cart.

You can use the following image to demo this option.

![QR Code](./docs/assets/qr.png)

### Accessibility
This App is adopted to demonstrate how Accessibility works on a Device.
You only need to enable the VoiceOver Mode (iOS) or Screen Reader (Android) on the Device.

After enabling it, you can go to the Products List screen and try to tap on some elements like Product Title or Image.
Then, you should hear text, which will be recognized by the VoiceOver or Screen Reader.

## Contributing to the App

If you want to contribute to the app and add new functionalities, please check the
documentation [here](./docs/CONTRIBUTING.md).

## Test automation

### Appium

[Here](./docs/AUTOMATION.md) you will find more information about:

- how to write Appium tests
- how to run tests on a local machine
- how to run tests in the cloud

## FAQ
### How to build the Application and start tests?
 - You can build the App in the Console or Terminal. All details can be found [here](./docs/CONTRIBUTING.md#building-the-app-from-the-terminal-or-console).
 - Tests can be executed on a local machine or on Mobitru. All details can be found [here](./docs/CONTRIBUTING.md#running-appium-tests-on-a-local-machine-in-the-cli).
### Which Flutter version is supported?
Flutter SDK 3.7+ and Dart SDK 2.19+.
### Is Dark Theme supported?
Not now, but it's in our plans.
