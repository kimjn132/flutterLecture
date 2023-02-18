import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});


  TextEditingController value = TextEditingController();
  late String value1;
  late List valueArray;
  late int currentSecond;
  late String arraySum;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('광고 문구'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('anna'),
              accountEmail: Text('anna@naver.com'),
            ),
            Text("광고문구"),
            TextField(
              controller: value,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                //changeTime2();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(20, 20),
              ),
              child: Text('입력'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: value,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                //changeTime2();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(20, 20),
              ),
              child: Text('입력'),
            ),
            Text(
              arraySum,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }

//function


}
