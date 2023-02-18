import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _imageName; //이미지 이름
  late bool _lampSize; //전구 크기
  late bool _lampOnOffStatus; //전구 onoff
  late double _lampWidth; //전구 너비
  late double _lampHeight; //전구 높이
  late double _lampSizeSlide;
  late double _lampAngle;
  late double _lampAngleResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = "images/lamp_on.png";
    _lampSize = true;
    _lampOnOffStatus = true;
    _lampHeight = 600;
    _lampWidth = 300;
    _lampSizeSlide = 0.5;
    _lampAngle = 0.5;
    _lampAngleResult = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image 확대 및 축소"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 350,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_lampAngle/360),
                      child: Image.asset(
                        _imageName,
                        width: _lampWidth,
                        height: _lampHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('전구확대'),
                      Switch(
                        value: _lampSize,
                        onChanged: (value) {
                          setState(() {
                            _lampSize = value;
                          });
                          sizeSwitch();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('전구스위치'),
                      Switch(
                        value: _lampOnOffStatus,
                        onChanged: (value) {
                          setState(() {
                            _lampOnOffStatus = value;
                          });
                          onoffSwitch();
                        },
                      ),
                    ],
                  )
                ],
              ),
              Slider(
                value: _lampSizeSlide,
                // min: 1,
                // max: 100,
                // divisions: 10,
                onChanged: (value) {
                  sizeSlide(value);
                },
              ),
              Slider(
                value: _lampAngle,
                // min: 1,
                // max: 100,
                // divisions: 10,
                onChanged: (value) {
                  angleSlide(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
//function-------

  sizeSwitch() {
    if (_lampSize == true) {
      setState(() {
        _lampWidth = 300;
        _lampHeight = 600;
      });
    } else {
      setState(() {
        _lampWidth = 150;
        _lampHeight = 300;
      });
    }
  } //lamp 사이즈 change

  sizeSlide(value) {
    setState(() {
      _lampSizeSlide = value;
      _lampWidth = _lampSizeSlide * 250 + 50;
      //_lampHeight = _lampSizeSlide * 30 + 300;
    });
  }

angleSlide(value){
  setState(() {
    _lampAngle = value;
    _lampAngleResult = _lampAngle / 360;
  });
}


  onoffSwitch() {
    if (_lampOnOffStatus == true) {
      setState(() {
        _imageName = "images/lamp_on.png";
      });
    } else {
      setState(() {
        _imageName = "images/lamp_off.png";
      });
    }
  }
} //end
