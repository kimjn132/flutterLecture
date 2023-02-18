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
        title: Text("Image Padding"),
        centerTitle: false,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/ppikka1.png",
                width: 100,
                height: 100,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/ppikka2.png",
                width: 100,
                height: 100,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/ppikka3.png",
                width: 100,
                height: 100,),
              ),
              
            ],
          ),
      ),
    );
  }
}
