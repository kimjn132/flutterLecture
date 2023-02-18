

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar/message.dart';



class WebSite extends StatefulWidget {
  const WebSite({super.key});

  @override
  State <WebSite> createState() => _WebSiteState();
}

class _WebSiteState extends State<WebSite> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename
  Message ms = Message();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = "www.daum.net";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
             
                isLoading = false;
             
            },
            onPageStarted: (url) {
              
                isLoading = true;
             
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(), //로딩 표 동그라미 표시
                )
              : Stack(),
        ],
      
      ),
    
    );
  }

//------function-----
  
}//end