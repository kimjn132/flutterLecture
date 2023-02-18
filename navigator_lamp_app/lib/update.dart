import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/message.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  //사용자가 수정한 글자
  TextEditingController updateController = TextEditingController();
  late bool lampSwitch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateController = TextEditingController();
    lampSwitch = true;
    rebuildUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: updateController,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("On"),
                  Switch(
                    value: lampSwitch,
                    onChanged: (value) {
                      setState(() {
                      lampSwitch = value;
                        
                      });
                      
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    updateInfo();
                   
                  },
                  child: const Text('OK'))
            ],
          ),
        ),
      ),
    );
  }//
  //function

  rebuildUpdate(){
    updateController.text = Message.input;
    lampSwitch = Message.switchOnOff;

  }//rebuildUpdate


  updateInfo(){
    
    Message.input = updateController.text;
    Message.lampImage = lampSwitch == true ? 'images/lamp_on.png' : 'images/lamp_off.png';
    Message.switchOnOff = lampSwitch;
    print(Message.lampImage);
   // print(Message.input);

 

  }//updateInfo

  





}//END
