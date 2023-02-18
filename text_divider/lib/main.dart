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
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

//stl(입력 후) + enter

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Exercies 01"),
        centerTitle: false,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  const Divider(
                  height: 30,
                  color: Colors.grey,
                  thickness: 0.5,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Divider(
                //   height: 30,
                //   color: Colors.grey,
                //   thickness: 0.5,
                // ),  // 나누는 선
                Text("유비"),
                SizedBox(
                  width: 20,
                ),
                Text("관우"),
                SizedBox(
                  width: 20,
                ),
                Text("장비"),
                
                // // Text(
                //   "조조",
                //   style: TextStyle(
                //     color: Colors.blue,
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 5, //글자 가로 간격 (자간)
                //     )
                //   ),

                // Text("여포"),
                // Text("동탁"),
                //       Divider(
                //   height: 30,
                //   color: Colors.grey,
                //   thickness: 0.5,
                // ),
              ],
            ),
        const Divider(
                  height: 30,
                  color: Colors.grey,
                  thickness: 0.5,
                ),          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Text(
                  "조조",
                  ),
                  SizedBox(
                  width: 20,
                ),

                Text("여포"),
                SizedBox(
                  width: 20,
                ),
                Text("동탁"),
        
              ],
            ),
            const Divider(
                  height: 30,
                  color: Colors.grey,
                  thickness: 0.5,
                ),
          ],
        ),
      ),
    );
  }
}
