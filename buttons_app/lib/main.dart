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
        title: const Text("Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //------dart언어 사용: on~은 함수
                print('text button');
              },
              onLongPress: () {
                print('long text button');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //-----
                print('Elevated Button');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  )),
              child: const Text(
                'Outlined Button',
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('Go back home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //---
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text('CBHome'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(130, 40)),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.home),
              label: const Text('Go Home'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //
              },
              //const 소스에서
              //final 실행할 때 결정난다.
              icon: const Icon(Icons.home),
              label: const Text('Go Home'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Color.fromARGB(255, 255, 226, 236),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //------dart언어 사용: on~은 함수
                  },
                  child: const Text(
                    'Text Button',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(130, 30),
                  ),
                  child: const Text(
                    "ElevatedButton",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
