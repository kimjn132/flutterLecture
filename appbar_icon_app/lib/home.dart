import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: const Text('App Bar Icon'),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.email),
          ),
          IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.add_alarm),
          ),
          IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {
              print('starfish image click');
            },
            child: Image.asset(
              'images/starfish.png',
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
