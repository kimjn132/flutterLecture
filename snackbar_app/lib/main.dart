import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
        title: const Text('Snack Bar'),
      ),
      body: const MySnackBar(),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       snackBarFunction(context);
      //     },
      //     child: const Text("SnackBar Button"),
      //   ),
      // ),
    );
  }

//-----functions------
  // snackBarFunction(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text(
  //       'ElevatedButton is Clicked.',
  //     ),
  //     duration: Duration(seconds: 1),
  //     backgroundColor: Colors.red,
  //   ));
  // }
}//end
