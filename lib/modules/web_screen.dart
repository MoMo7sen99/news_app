import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
    const WebViewScreen({Key? key, this.url}) : super(key: key);

 final String? url;

  @override
  Widget build(BuildContext context) {
    WebViewController webController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(Uri.parse(url!)
    );
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: webController)
    );
  }
}
