import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/common/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_demo_app/l10n/app_localizations.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  final _webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(aboutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, AppLocalizations.of(context)!.aboutPageTitle),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
