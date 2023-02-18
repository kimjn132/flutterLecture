import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _imageName; //이미지 이름
  late double _lampWidth; //이미지 너비
  late double _lampHeight;  //이미지 높이
  late bool _lampOnOffStatus; //램프 onoff 상태 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = "images/lamp_on.png";
    _lampWidth = 300;
    _lampHeight = 600;
    _lampOnOffStatus = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert를 이용한 메세지 출력"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              _imageName,
              width: _lampWidth,
              height: _lampHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    lampOnAlert(context);
                  },
                  
                  child: Text("켜기"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      lampOff(context);
                    },
                    child: Text("끄기"))
              ],
            )
          ],
        ),
      ),
    );
  }

//function

//램프 on 확인
  lampOnAlert(BuildContext context) {
    //램프 on 확인
    if (_lampOnOffStatus == true) {
      showDialog(
          context: context,
          barrierDismissible: false, //user must tap the button only!
          builder: (BuildContext ctx) {
            return AlertDialog(
              //내용 쓰는 친구
              title: const Text('경고'),
              content: const Text('현재 램프가 켜진 상태입니다.'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text("네, 알겠습니다."))
              ],
            );
          }); //builder: 새로 만드는 친구
    }else{
      showDialog(
          context: context,
          barrierDismissible: false, //user must tap the button only!
          builder: (BuildContext ctx) {
            return AlertDialog(
              //내용 쓰는 친구
              title: const Text('램프 켜기'),
              content: const Text('램프를 켜시겠습니까?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      lampStatus();
                    }, 
                    child: Text("네")),
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text("아니오"))
              ],
            );
          });
    }
  } //_showDialog

//lamp on switch dialog
  lampOff(BuildContext context) {
    if (_lampOnOffStatus == true) {
      showDialog(
          context: context,
          barrierDismissible: false, //user must tap the button only!
          builder: (BuildContext ctx) {
            return AlertDialog(
              //내용 쓰는 친구
              title: const Text('램프 끄기'),
              content: const Text('램프를 끄시겠습니까?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      lampStatus();
                    }, 
                    child: Text("네")),
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text("아니오"))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false, //user must tap the button only!
          builder: (BuildContext ctx) {
            return AlertDialog(
              //내용 쓰는 친구
              title: const Text('경고'),
              content: const Text('현재 램프가 꺼진 상태입니다.'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text("네, 알겠습니다."))
              ],
            );
          });
    }
  }

  //lamp status
  lampStatus() {
    if (_lampOnOffStatus == true) {
      setState(() {
        _imageName = "images/lamp_off.png";
        _lampOnOffStatus = false;
      });
        
    } else {
      setState(() {
        _imageName = "images/lamp_on.png";
        _lampOnOffStatus = true;
      });
    }
  }
}//end
