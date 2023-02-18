import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //map code ({})
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  //build: rendering engine(화면 그리는 역할)
  Widget build(BuildContext context) {
    return Scaffold(
      //화면 상단 
      appBar: AppBar(
        // const: is similar to java final
        title: const Text('대한민국'),
        centerTitle: true,
      ),
      body: Center(
        //column 밑으로 쌓아가는 역할 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('유비'),
            SizedBox(
              height: 50,
            ),
            Text('관우'),
            Text('장비'),
          ],
        ),
      ),
    );
  }
}