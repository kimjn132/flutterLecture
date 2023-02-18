import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int num1;
  late int num2;
  late int result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    num1 = 0;
    num2 = 0;
    result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('덧셈 구하기'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController1,
              decoration: InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: textEditingController2,
              decoration: InputDecoration(labelText: '두번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController1.text.isEmpty) {
                  errorSnackBar1(context);
                }
                if (textEditingController2.text.isEmpty) {
                  errorSnackBar2(context);
                }
                resultSum();
                
              },
              child: const Text('덧셈 계산'),
            ),
            Text('$result'),
          ],
        ),
      ),
    );
  }
//function

  errorSnackBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('첫번째 숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('두번째 숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  resultSum() {
    if (textEditingController1.text.isNotEmpty &
        textEditingController2.text.isNotEmpty) {
      num1 = int.parse(textEditingController1.text);
      num2 = int.parse(textEditingController2.text);
      setState(() {
        result = num1 + num2;
      });
    }
  }
}
