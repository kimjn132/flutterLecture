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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("영웅 Card"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/SunShinLee.jpeg"),
                    radius: 50,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
              color: Colors.black,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text("성웅",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,

                  ),
                  ),
                ),
                
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text("이순신",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text("전적",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text("62전 62승",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("옥포해전"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("사천포해전"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("당포해전"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("한산도대첩"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("부산포해전"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("명량해전"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text("노량해전"),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("images/TurtleShip.gif"),
                  backgroundColor: Colors.orange,
                  radius: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
