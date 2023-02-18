import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late bool colorSwitch;
  late bool onOffSwitch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorSwitch = false;
    onOffSwitch = true;
    rebuildUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red'),
                Switch(
                  value: colorSwitch,
                  onChanged: (value) {
                    setState(() {
                    colorSwitch = value;
                      
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Off'),
                Switch(
                  value: onOffSwitch,
                  onChanged: (value) {
                    setState(() {
                    onOffSwitch = value;
                      
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _lampChange();
              }, 
            child: Text("OK"))
          ],
        ),
      ),
    );
  }//
//function----------------------
_lampChange(){
  Message.color = colorSwitch;
  Message.onOff = onOffSwitch;
  // onOffSwitch == true ? 'images/lamp_on.png' : 'images/lamp_off.png';
  Message.lampPicture = colorSwitch == true ? 'images/lamp_red.png' : 
                        onOffSwitch == true ? 'images/lamp_on.png' : 'images/lamp_off.png';
  



}//_lampChange

rebuildUpdate(){
  setState(() {
  colorSwitch = Message.color;
  onOffSwitch = Message.onOff;
    
  });

}



}//end
