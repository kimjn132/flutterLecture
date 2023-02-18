import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lampImage = 'images/lamp_on.png';
    //rebuildData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/update").then((value) =>rebuildData());
              saveInfo();
            },
            icon: Icon(Icons.abc_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200, 
              height: 200, 
            child: Image.asset(lampImage)),
          ],
        ),
      ),
    );
  } //

//function
  rebuildData() {
   setState(() {
    lampImage = Message.lampPicture;
   });
  }//rebuildData

saveInfo(){

  
  Message.color = lampImage == 'images/lamp_red.png' ? true : false;
  Message.onOff = lampImage == 'images/lamp_on.png' ? true : false;

  
  

}

}//END