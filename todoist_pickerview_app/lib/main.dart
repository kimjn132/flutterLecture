import 'package:flutter/material.dart';
import 'package:todoist_pickerview_app/view/home.dart';
import 'package:todoist_pickerview_app/view/insert.dart';

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
      //home: const Home(),
      routes: {
        '/' :(context) => const Home(),
        '/insert' :(context) => const InsertPage(),
      },
      initialRoute: '/',
    );
  }
}
