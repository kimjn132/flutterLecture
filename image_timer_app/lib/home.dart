import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imagesFile;
  late int currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagesFile = [
      "flower_01.png",
      "flower_02.png",
      "flower_03.png",
      "flower_04.png",
      "flower_05.png",
      "flower_06.png",
    ];
    currentPage = 0;

    // Timer 설치, scaffold랑은 따로 논다. async
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeImage();
    });
  }



  @override
  Widget build(BuildContext context) {
    //scaffold: 그림 그리는 애.
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한반복'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(
                imagesFile[currentPage],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Image.asset(
                'images/${imagesFile[currentPage]}',
                width: 400,
                height: 600,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      ),
    );
  }
//functions

//Timer
  changeImage() {
    setState(() {
      currentPage++;
      if (currentPage >= imagesFile.length) {
        currentPage = 0;
      }
    });
  }
}
