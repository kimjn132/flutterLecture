import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; //Image Name
  late double _lampWidth; // image width
  late double _lampheight; //image height
  late String _buttonName; // Button title
  late bool _switch; //스위치 상태

  //bool로 해보자
  late String _lampSizeStatus; //상태변수(현재 버튼의 상태를 알고 있는 변수)- 현재 화면의 lamp 크기

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampheight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image 확대 및 축소"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              //이미지가 child 안에 있으면 child가 모든 컬럼을 독점하고 있기 때문에 확대 축소가 안된다. 그러므로 children으로 감싸서 축소 확대 가능하도록 한다.
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampheight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      decisionLampSize();
                    },
                    child: Text(_buttonName)),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(fontSize: 12),
                    ),
                    Switch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                          _switch = value;
                          });
                          decisionOnOff();
                        }) //  value: 화면에 뜨는 모양, onchanged: 사용자가 바꿨을 때
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
//웹: MVC
//어플 - MVVM: model view view model
//>>분리!
  //-----function-------------

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      setState(() {
        _lampWidth = 300;
        _lampheight = 600;
        _buttonName = 'Image 축소';
        _lampSizeStatus = 'large';
      });
    } else {
      setState(() {
        _lampWidth = 150;
        _lampheight = 300;
        _buttonName = 'Image 확대';
        _lampSizeStatus = 'small';
      });
    }
  }//decisionLampSize

  decisionOnOff(){

    if(_switch){
      setState(() {
        _lampImage = 'images/lamp_on.png';
      });
    }else{
      setState(() {
        _lampImage = 'images/lamp_off.png';
      });
    }

  } //decisionOnOff
} // end