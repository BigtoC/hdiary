import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BigtoC/hnotes"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: WebView(
        initialUrl: "https://github.com/BigtoC/hnotes",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
