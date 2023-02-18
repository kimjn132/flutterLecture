import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController addition = TextEditingController();
  TextEditingController subtraction = TextEditingController();
  TextEditingController multiplication = TextEditingController();
  TextEditingController division = TextEditingController();

  late int result;

  @override
  void initState() {
    super.initState();
    value1 = TextEditingController();
    value2 = TextEditingController();
    addition = TextEditingController();
    subtraction = TextEditingController();
    multiplication = TextEditingController();
    division = TextEditingController();

    result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 계산기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: value1,
                decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: value2,
                decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (value1.text.isEmpty || value2.text.isEmpty) {
                        errorSnackBar1(context);
                      } else {
                        resultAll();
                      }
                    },
                    child: const Text('계산하기'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      resultClean();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('지우기'),
                  ),
                ],
              ),
              TextField(
                controller: addition,
                decoration: const InputDecoration(labelText: '덧셈 결과'),
                readOnly: true,
              ),
              TextField(
                controller: subtraction,
                decoration: const InputDecoration(labelText: '뺄셈 결과'),
                readOnly: true,
              ),
              TextField(
                controller: multiplication,
                decoration: const InputDecoration(labelText: '곱셈 결과'),
                readOnly: true,
              ),
              TextField(
                controller: division,
                decoration: const InputDecoration(labelText: '나눗셈 결과'),
                readOnly: true,
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
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  resultAll() {
    int num1 = int.parse(value1.text);
    int num2 = int.parse(value2.text);

    setState(() {
      addition.text = (num1 + num2).toString();
      subtraction.text = (num1 - num2).toString();
      multiplication.text = (num1 * num2).toString();

      if (num2 == 0) {
        division.text = '계산불가';
      } else {
        division.text = (num1 / num2).toString();
      }
    });
  }

  resultClean() {
    value1.text = '';
    value2.text = '';
    addition.text = '';
    subtraction.text = '';
    multiplication.text = '';
    division.text = '';
  }
} // end
