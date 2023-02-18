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
  late bool isLoading;
  late String siteName;
  TextEditingController siteNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = 'www.daum.net';
    siteNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
             //asserttion Error!! >> textfield 사이즈가 너무 길어서 그랬음 >>sizedbox로 width 줄여주면 된다.
              SizedBox(
                width: 250,
                child: TextField(
                  controller: siteNameController,
                  decoration: const InputDecoration(
                    hintText: '사이트를 입력하세요',
                  
                  ),
                  keyboardType: TextInputType.url,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed:() {
                    siteName = siteNameController.text;
                    _reloadSite();
                  },
                  icon: const Icon(
                    Icons.search
                  ),),
              ),

                ],
              ),
            ],
          )),
        
      ),
      body: Stack(
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
                  child: CircularProgressIndicator(), //로딩 표 동그라미 표시
                )
              : Stack(),
        ],
      ),

      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  controller.data!.goBack();  //data가 이동할 때 null값 발생한다. !가 없으면 null값이 있을때 실행자체가 불가하므로 !붙여줘야 한다.
                },
                child: const Icon(Icons.arrow_back),
              );
            }
            return Stack();
          }),
    );
  }

  _reloadSite(){
  _controller.future.then((value) => value.loadUrl('https://$siteName'));
}

}
