import 'dart:async';


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename

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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: 100,
        title: Center(
          child: Column(
          children: [
            const Text(
              "WebView",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),),
                  onPressed: () {
                    setState(() {
                      siteName = "www.google.com";
                      _reloadSite();
                    });
                  }, 
                  child: const Text('Google')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),),
                  onPressed: () {
                    setState(() {
                      siteName = "www.naver.com";
                      _reloadSite();
                    });
                  }, 
                  child: const Text('Naver')),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),),
                  onPressed: () {
                    setState(() {
                      siteName = "www.daum.net";
                      _reloadSite();
                    });
                  }, 
                  child: const Text('Daum')),
                ),
                ],
              ),
          ],
        )),
      ),
      body: 
      Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
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
                  child: CircularProgressIndicator(), //?????? ??? ???????????? ??????
                )
              : Stack(),
        ],
      ),

      //?????? ?????? ????????? ??????(????????????)
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  controller.data!.goBack();  //data??? ????????? ??? null??? ????????????. !??? ????????? null?????? ????????? ??????????????? ??????????????? !???????????? ??????.
                },
                child: const Icon(Icons.arrow_back),
              );
            }
            return Stack();
          }),
    );
  }
//------function-----
_reloadSite(){
  _controller.future.then((value) => value.loadUrl('https://$siteName'));
}


}//end
