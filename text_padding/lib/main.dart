import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text with Column and Row'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  //padding-all: 상하좌우 , fromLTRB: 각자 따로따로 공간을 준다.
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_balance),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("James"),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Cathy"),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Kenny"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//sizebox보다 padding을 더 많이 쓴다. 왜냐하면 퍼포먼스때문이다.
