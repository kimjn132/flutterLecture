import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _imageName;
  late bool _lampColor;
  late bool _lampSize;
  late bool _lampOnOff;
  late double _lampHeight;
  late double _lampWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = "images/lamp_on.png";
    _lampColor = false;
    _lampSize = true;
    _lampWidth = 300;
    _lampHeight = 600;
    _lampOnOff = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
      ),
      body: Center(
          child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: 350,
                height: 650,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _imageName,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("전구 색깔"),
                  Switch(
                    value: _lampColor,
                    onChanged: (value) {
                      setState(() {
                        _lampColor = value;
                      });
                      colorChange();
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text('전구 확대'),
                  Switch(
                    value: _lampSize,
                    onChanged: (value) {
                      setState(() {
                        _lampSize = value;
                      });
                      sizeChange();
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text('전구 스위치'),
                  // Switch(
                  //   value: _lampOnOff,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _lampOnOff = value;
                  //     });
                  //     onOffChange();
                  //   },
                  // ),
                  CupertinoSwitch(
                    value: _lampOnOff,
                    onChanged: (value) {
                      setState(() {
                        _lampOnOff = value;
                      });
                      onOffChange();
                    },
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
//function

  colorChange() {
    if (_lampColor == true) {
      setState(() {
        _imageName = "images/lamp_red.png";
      });
    } else {
      setState(() {
        _imageName = "images/lamp_on.png";
      });
    }
  } //램프 색깔

  sizeChange() {
    if (_lampSize == true) {
      setState(() {
        _lampWidth =
        300;
        _lampHeight =
        600;
      });
    } else {
      setState(() {
        _lampWidth =
        150;
        _lampHeight =
        300;
      });
    }
  } // 램프 사이즈

  onOffChange() {
    if (_lampOnOff == true) {
      setState(() {
        _imageName = "images/lamp_on.png";
      });
    } else {
      _imageName = "images/lamp_off.png";
    }
  }
} //end
