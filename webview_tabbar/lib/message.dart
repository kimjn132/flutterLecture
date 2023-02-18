import 'dart:async';


import 'package:webview_flutter/webview_flutter.dart';

class Message{

  static String naver = 'www.naver.com';
  static String daum = 'www.daum.net';
  static String google = 'www.google.com';

  static List websitesArray = ['www.naver.com', 'www.daum.net', 'www.google.com'];

final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename


  

}