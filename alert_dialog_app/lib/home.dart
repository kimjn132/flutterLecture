
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog with Gesture"),
      ),
      body:  Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Hello World'
          ),
        ),
        //Gesture: swipe, pinch
      ),
    );
  }

//function--------
  // class(새로운 화면 만듬))
_showDialog(BuildContext context){
  showDialog(
    context: context, 
    barrierDismissible: false,  //user must tap the button only!
    builder: (BuildContext ctx) {
      return AlertDialog(
        //내용 쓰는 애 
        title: const Text('Alert Title'),
        content: const Text('Hello World를 Touch했습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(), 
            child: const Text('종료'),),
        ],
      );
    });//builder: 새로 만드는 친구
}


}//end