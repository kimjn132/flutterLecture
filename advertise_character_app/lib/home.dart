import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var value = TextEditingController();
  late String value1;
  late List valueArray;
  late int currentSecond;
  late String arraySum;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //처음 초기값 
    value = TextEditingController();
    valueArray = [];
    currentSecond = 0;
    arraySum = "";


    //Timer
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (valueArray.isNotEmpty) {
        changeTime();
      } //valueArray가 비어있지 않은 상태에서면 함수 실행
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('광고 문구'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('anna'),
              accountEmail: Text('anna@naver.com'),
            ),
            const Text("광고문구"),
            TextField(
              controller: value,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                changeTime();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(20, 20),
              ),
              child: const Text('입력'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(arraySum)],
        ),
      ),
    );
  }

//function

  changeTime() {

    //split 여기서 안해주면 valueArray가 입력값을 못받는다.
    valueArray = value.text.split("");
    setState(() {
      if (currentSecond >= valueArray.length) {
        currentSecond = 0;
        arraySum = "";
      }

      
      // print(valueArray);
      arraySum += valueArray[currentSecond];
      currentSecond++;
    });
  }
}//end