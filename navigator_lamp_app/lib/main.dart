import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/home.dart';
import 'package:navigator_lamp_app/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      //home: const Home(),
      routes: {
        '/' :(context) => const Home(),
        '/update' :(context) => const Update(),
      },
      initialRoute: '/',
    );
  }
}
