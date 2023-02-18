import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
      "flower_06.png"
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onSwipe,
        onVerticalSwipe: _onSwipe,
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
            ],
          ),
        ),
      ),
    );
  }

//function-------

// 가로, 세로 둘다 한 메소드 안에서 가능하게 한다.
  _onSwipe(SwipeDirection direction) {
    setState(() {

      if(direction == SwipeDirection.left || direction == SwipeDirection.up){
        currentImage += 1;
        if(currentImage >= imageName.length){
          currentImage = 0;
        }
      }

      if(direction == SwipeDirection.right || direction == SwipeDirection.down){
        currentImage = currentImage - 1;
        if(currentImage < 0){
          currentImage =  imageName.length -1 ;
        }
      }

    });
  }


  // _onVerticalSwipe(SwipeDirection direction){
  //   setState(() {
  //     if(direction == SwipeDirection.up){
  //       currentImage += 1;
  //       if(currentImage >= imageName.length){
  //         currentImage = 0;
  //       }
  //     }

  //     if(direction == SwipeDirection.down){
  //       currentImage = currentImage - 1;
  //       if(currentImage < 0){
  //         currentImage =  imageName.length -1 ;
  //       }
  //     }

  //   });
  // }
}//end