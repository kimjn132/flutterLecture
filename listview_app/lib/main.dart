import 'package:flutter/material.dart';
import 'package:listview_app/view/logIn.dart';

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
      home: const LogIn(),
      //  routes: {
      //   '/' :(context) => const Home(),
      //   '/insert' :(context) => const Insert(),
      // },
      // initialRoute: '/',
    );
  }
}