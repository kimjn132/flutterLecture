
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Message'),
        centerTitle: true,
      ),
      body: MyToast(),
    );
  }
  //function----------



}//End


class MyToast extends StatelessWidget {
  const MyToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => flutterToast(),
        child: const Text('Toast Button')),
    );
  }
//function--------------

flutterToast(){
  Fluttertoast.showToast(
    msg: 'Toast Button is clicked',
      gravity: ToastGravity.TOP,  //message 나타나는 위치
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,  //메시지 나타나는 시간
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );

}//flutterToast


}//end