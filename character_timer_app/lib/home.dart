import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String korea;
  late List koreaSt;
  late int currentKorea;
  late String koreaSum;
//  late List map;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    korea = "대한민국";
    koreaSt = korea.split("");
    currentKorea = 0;
    koreaSum = "";
    // map = [];

//timer
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeKorea();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              koreaSum,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
//function

  changeKorea() {
    setState(() {
      if (currentKorea >= koreaSt.length) {
        currentKorea = 0;
        koreaSum = "";
      }
      koreaSum += koreaSt[currentKorea];
      currentKorea++;

    });
  }
}
