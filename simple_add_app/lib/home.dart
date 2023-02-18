import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late String num1;
  late String num2;
  late String result;
  late int intResult;

  @override
  void initState() {
    
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    num1 = '';
    num2 = '';
    result = '';
    intResult = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text('덧셈 결과 : $intResult'),
              Container(
                color: Colors.amber,
                width: 120,
                child: 
              
              TextField(
                controller: textEditingController1,
                decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              ),
              TextField(
                controller: textEditingController2,
                decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(onPressed: () {
                 if (textEditingController1.text.isEmpty) {
                      errorSnackBar1(context);
                    }
                    if (textEditingController2.text.isEmpty) {
                      errorSnackBar2(context);
                    }
                    resultSum();
              }, 
              child: SizedBox(
                width: 120,
                height: 40,
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('덧셈계산'),
                  ],
                ),
              ),
              ),
            ],
          ),
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
      num1 = textEditingController1.text;
      num2 = textEditingController2.text;
      setState(() {
       int intNum1 = int.parse(num1);
       int intNum2 = int.parse(num2);
       intResult = intNum1+intNum2;
      });
    }
  }



}
