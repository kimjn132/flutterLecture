import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  //생성자 통하는 것은 데이터 변함이 없어야 된다.>>final사용
  final String id;
  final String pw;

  //클래스이름(받아올 값 : parameter)>>final만 받음
  const SecondPage({super.key, required this.id, required this.pw});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("${widget.id}님 환영합니다. ${widget.pw}"), //  현재 클래스가 상단의 SecondPage의 "상속"을 받아서 widget사용 가능 

      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/bitcoin.jpg'),
          radius: 100,
        ),
      ),
    );
  }
}