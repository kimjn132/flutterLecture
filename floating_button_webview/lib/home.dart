import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String siteName;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  //reload page


  late bool isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    siteName = 'www.naver.com';
    isLoading = true;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Button WebView'),
      ),
      body: Center(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://$siteName',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
              onPageFinished: (url) {
                setState(() {
                  isLoading = false;
                });
              },
              onPageStarted: (url) {
                setState(() {
                  isLoading = true;
                });
              },
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(), //로딩 표 동그라미 표시
                  )
                : Stack(),
          ],
        ),
      ),
      floatingActionButton: 
      FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goBack();  //data가 이동할 때 null값 발생한다. !가 없으면 null값이 있을때 실행자체가 불가하므로 !붙여줘야 한다.
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.reload(); //data가 이동할 때 null값 발생한다. !가 없으면 null값이 있을때 실행자체가 불가하므로 !붙여줘야 한다.
                  },
                  child: const Icon(Icons.replay),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goForward();  //data가 이동할 때 null값 발생한다. !가 없으면 null값이 있을때 실행자체가 불가하므로 !붙여줘야 한다.
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
                ],
              );
              
              
            }
            

            return Stack();
          }),
        
      

    );
  }
}