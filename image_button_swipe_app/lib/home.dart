import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = [
      "flower_01.png",
      "flower_02.png",
      "flower_03.png",
      "flower_04.png",
      "flower_05.png",
      "flower_06.png",
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350,
                  height: 600,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _onLeft,
                    child: const Text("<<이전"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: _onRight,
                    child: const Text("다음>>"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//function-------

// 다음 버튼 누르면 화면 이동
  _onRight() {
    setState(() {
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }

// 이전 버튼 누르면 화면 이동 
  _onLeft() {
    setState(() {
      currentImage = currentImage - 1;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    });
  }
}
