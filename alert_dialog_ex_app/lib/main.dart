import 'package:alert_dialog_ex_app/screen.dart';
import 'package:alert_dialog_ex_app/screen2nd.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Screen(),
        '/1st': (context) => const Screen2(),

      },
    );
  }
}
