

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController value1;
  late TextEditingController value2;
  TextEditingController additionR = TextEditingController();
  TextEditingController subtractionR = TextEditingController();
  TextEditingController multiplicationR = TextEditingController();
  TextEditingController divisionR = TextEditingController();
  late bool addition;
  late bool subtration;
  late bool multiplication;
  late bool division;
  // 전체 지우면 첫번째 텍스트필드로 포커스 이동 
  late FocusNode myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addition = true;
    subtration = true;
    multiplication = true;
    division = true;
    value1 = TextEditingController();
    value2 = TextEditingController();
    additionR = TextEditingController();
    subtractionR = TextEditingController();
    multiplicationR = TextEditingController();
    divisionR = TextEditingController();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //계산 완료되면 키보드 내려가기 
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                 // 첫번째 숫자 텍스트필드
                  TextField(
                    controller: value1,
                    decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    focusNode: myFocusNode,
                  ),
                  //두번째 숫자 텍스트필드
                  TextField(
                    controller: value2,
                    decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
        
        
                  //버튼 row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //계산하기 
                      ElevatedButton(
                        onPressed: () {
                          if (value1.text.isEmpty || value2.text.isEmpty) {
                            errorSnackBar1(context);
                          } else {
                            calc();
                            //계산 완료되면 키보드 내려가기 
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(90, 35),
                        ),

                        child: const Text('계산하기'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      //지우기 버튼
                      ElevatedButton(
                        
                        onPressed: () {
                          clear();
                          FocusScope.of(context).requestFocus(myFocusNode);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(90, 35),
                        ),
                        child: const Text('지우기'),
                      ),
                    ],
                  ),
        
                  //스위치 버튼 
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('덧셈 :'),
                        Switch(
                            value: addition,
                            onChanged: (val) {
                              if (value1.text.isEmpty || value2.text.isEmpty) {
                                errorSnackBar1(context);
                              } else {
                                setState(() {
                                  //calc();
                                  addition = val;
                                  switchCalc(addition);
                                });
                              }
                            }),
                        const Text('뺄셈 :'),
                        Switch(
                            value: subtration,
                            onChanged: (value) {
                              if (value1.text.isEmpty || value2.text.isEmpty) {
                                errorSnackBar1(context);
                              } else {
                                setState(() {
                                  subtration = value;
                                  switchCalc(subtration);
                                });
                              }
                            }),
                        const Text('곱셈 :'),
                        Switch(
                            value: multiplication,
                            onChanged: (value) {
                              if (value1.text.isEmpty || value2.text.isEmpty) {
                                errorSnackBar1(context);
                              } else {
                                setState(() {
                                  multiplication = value;
                                  switchCalc(multiplication);
                                });
                              }
                            }),
                        const Text('나눗셈 :'),
                        Switch(
                            value: division,
                            onChanged: (value) {
                              setState(() {
                                division = value;
                                switchCalc(division);
                              });
                            }),
                      ],
                    ),
                  ),
        
                  //결과 나오는 텍스트필드 
                  TextField(
                    controller: additionR,
                    decoration: const InputDecoration(labelText: '덧셈 결과'),
                    readOnly: true,
                  ),
                  TextField(
                    controller: subtractionR,
                    decoration: const InputDecoration(labelText: '뺄셈 결과'),
                    readOnly: true,
                  ),
                  TextField(
                    controller: multiplicationR,
                    decoration: const InputDecoration(labelText: '곱셈 결과'),
                    readOnly: true,
                  ),
                  TextField(
                    controller: divisionR,
                    decoration: const InputDecoration(labelText: '나눗셈 결과'),
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





//function----------------------

//숫자 입력 안하면 스낵바 띄우기
  errorSnackBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

//전체 계산하기
  calc() {
    int num1 = int.parse(value1.text);
    int num2 = int.parse(value2.text);

    setState(() {
      addition = true;
      subtration = true;
      multiplication = true;
      division = true;

      additionR.text = (num1 + num2).toString();
      subtractionR.text = (num1 - num2).toString();
      multiplicationR.text = (num1 * num2).toString();

      if (num2 == 0) {
        divisionR.text = '계산불가';
      } else {
        divisionR.text = (num1 / num2).toStringAsFixed(2);
      }
    });
  }

//전체 지우고 스위치 on상태로 전체 돌리기
  clear() {
    value1.text = '';
    value2.text = '';
    additionR.text = '';
    subtractionR.text = '';
    multiplicationR.text = '';
    divisionR.text = '';
    setState(() {
      addition = true;
      subtration = true;
      multiplication = true;
      division = true;
    });

  }


//스위치로 계산하기 
  switchCalc(bool cac) {
    int num1 = int.parse(value1.text);
    int num2 = int.parse(value2.text);

    setState(() {
      // switch add
      if (addition == true) {
        //addition = false;
        additionR.text = (num1 + num2).toString();
      } else {
        //addition = false;
        additionR.text = "";
      }

//subtraction
      if (subtration == true) {
        //subtration = false;
        subtractionR.text = (num1 - num2).toString();
      } else {
        //subtration = true;
        subtractionR.text = "";
      }


//multiplication
      if (multiplication == true) {
        multiplicationR.text = (num1 * num2).toString();
       // multiplication = false;
      } else {
        //multiplication = true;
        multiplicationR.text = "";
      }


//division
      if (division == true) {
        //division = false;
        if (num2 == 0) {
          divisionR.text = '계산불가';
        } else {
          divisionR.text = (num1 / num2).toStringAsFixed(2);
        }
      } else {
       // division = true;
        divisionR.text = "";

      }
    });
  }
} //end
