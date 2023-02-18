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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Image Fitting"),
      ),
      //scroll 기능 - singleChildScrollView
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Image.asset(
             'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/starfish.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ],
        )),
      ),
    );
  }
}

//yaml 파일 띄어쓰기 조심하자.
//>>command + / 를 애용하자.