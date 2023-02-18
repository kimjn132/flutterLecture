
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      // appBar: AppBar(
      //   title: const Text("Image Ex01"),
      //   centerTitle: false,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage(
                "images/pomheart.png",
              ),
              radius: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
              backgroundImage: AssetImage("images/pompompurin.png",
              ),
              radius: 50,
            ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
            backgroundImage: AssetImage("images/pompompurindaddy.jpeg",
            ),
            radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
