import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //사용자가 입력한 글자
  TextEditingController inputController = TextEditingController();
  late String homeImage;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    inputController = TextEditingController();
    homeImage = 'images/lamp_on.png';
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed:() {
              addInfo();
              Navigator.pushNamed(context, "/update").then((value) =>rebuildMain());


            }, 
            icon: const Icon(
              Icons.home
            ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: inputController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요'
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(homeImage))
            ],
          ),
        ),
      ),
    );
  }//
//function------------

addInfo(){
  setState(() {
    
//print(Message.switchOnOff);
  });
  Message.input = inputController.text;
  Message.lampImage == 'images/lamp_on.png' ? Message.switchOnOff = true : Message.switchOnOff = false;
print(Message.lampImage);
print(Message.input);
}

//update후 다시 돌아왔을 때 수정된 정보 rebuild
rebuildMain(){
//
  inputController.text = Message.input;
setState(() {
  
  // homeImage = Message.switchOnOff == true ? 'images/lamp_on.png' : 'images/lamp_off.png';
    homeImage = Message.lampImage;
    print(Message.switchOnOff);
});
}



}//END