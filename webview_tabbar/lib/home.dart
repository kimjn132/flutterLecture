import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar/message.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // TabController
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late List websitesArray = ['www.naver.com', 'www.daum.net', 'www.google.com'];
  late int selectedIndex;
  late bool isLoading; //for indicator
  //late String siteName; //sitename
  @override
  void initState() {
    super.initState();
    // controller = TabController(length: 1, vsync: this);
    selectedIndex = 0;
    isLoading = true;
    websitesArray[selectedIndex];
    //siteName = 'www.naver.com';
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),

            label: "네이버",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "다음",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "구글",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: (i) {
          // _controller.complete(Message.websitesArray[i]);
          _reloadSite(selectedIndex);
          setState(() => selectedIndex = i);
          print(selectedIndex);
        },
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://${Message.websitesArray[selectedIndex]}',
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
_reloadSite(int selectedIndex){
  _controller.future.then((value) => value.loadUrl('https://${Message.websitesArray[selectedIndex]}'));
}

}

