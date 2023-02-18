import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const List<Widget> gender = <Widget>[
  Text('여자'),
  Text('남자'),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController age;
  late TextEditingController height;
  late TextEditingController weight;
  TextEditingController result = TextEditingController();
  TextEditingController resultContent = TextEditingController();
  late double resultNum;

  //tabbar
  late List<bool> _selectedGender = <bool>[true, false];
  bool vertical = false;

  @override
  void initState() {
    super.initState();

    age = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    result = TextEditingController();
    resultContent = TextEditingController();
    resultNum = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI계산기"),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                width: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              // The button that is tapped is set to true, and the others to false.
                              for (int i = 0; i < _selectedGender.length; i++) {
                                _selectedGender[i] = i == index;
                              }
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.blue,
                          selectedColor: Colors.white,
                          fillColor: Colors.lightBlue[400],
                          color: Colors.red[400],
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedGender,
                          children: gender,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: age,
                            decoration: const InputDecoration(
                                // border: OutlineInputBorder(
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(10.0)),
                                //     borderSide: BorderSide(width: 0.3)),
                                labelText: '나이'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: height,
                            decoration: const InputDecoration(labelText: '신장'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text('cm'),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: weight,
                            decoration: const InputDecoration(labelText: '몸무게'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text('kg'),
                        SizedBox(
                          width: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {

                            if(age.text.isEmpty || height.text.isEmpty || weight.text.isEmpty){
                              errorSnackBar1(context);
                            }else{

                            calc();
                            }
                            // Navigator.pushNamed(context, "/result", arguments: calc());
                          },
                          
                          child: const Text("계산"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: result,
                            decoration: const InputDecoration(labelText: '지수'),
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clear();
                          },
                          child: Text('초기화'),
                        ),
                      ],
                    ),
                    SfLinearGauge(
                      barPointers: [
                        LinearBarPointer(
                          value: resultNum,
                          color: Colors.lightGreen,
                        ),
                      ],
                      maximum: 70,
                    ),
                    SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        showLabels: false,
                        showAxisLine: false,
                        showTicks: false,
                        minimum: 15,
                        maximum: 40,
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 15,
                              endValue: 20,
                              color: Color(0xFFFE2A25),
                              label: '저체중',
                              sizeUnit: GaugeSizeUnit.factor,
                              labelStyle: GaugeTextStyle(
                                  fontFamily: 'Times', fontSize: 20),
                              startWidth: 0.65,
                              endWidth: 0.65),
                          GaugeRange(
                            startValue: 20,
                            endValue: 25,
                            color: Color(0xFFFFBA00),
                            label: '정상',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            startWidth: 0.65,
                            endWidth: 0.65,
                            sizeUnit: GaugeSizeUnit.factor,
                          ),
                          GaugeRange(
                            startValue: 25,
                            endValue: 30,
                            color: Colors.green[400],
                            label: '과체중',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.65,
                            endWidth: 0.65,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 35,
                            color: Colors.blue[400],
                            label: '비만',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.65,
                            endWidth: 0.65,
                          ),
                          GaugeRange(
                            startValue: 35,
                            endValue: 40,
                            color: Colors.purple[400],
                            label: '고도비만',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.65,
                            endWidth: 0.65,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: resultNum)
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//function-----------------

  calc() {
    double weightNum = double.parse(weight.text);
    double heightNum = double.parse(height.text);

    setState(() {
      resultNum =
          (weightNum / (heightNum / 100 * heightNum / 100)).roundToDouble();

      if (resultNum >= 35) {
        resultContent.text = '고도비만';
      } else if (resultNum >= 30) {
        resultContent.text = '비만';
      } else if (resultNum >= 25) {
        resultContent.text = '과체중';
      } else if (resultNum >= 20) {
        resultContent.text = '정상';
      } else {
        resultContent.text = '저체중';
      }

      result.text = resultNum.toString();

      // print(result.text);
      //print(resultNum);
    });
  } //calc

  clear() {
// age = TextEditingController();
//     height = TextEditingController();
//     weight = TextEditingController();
//     result = TextEditingController();
//     resultContent = TextEditingController();
//     resultNum = 0.0;
    setState(() {
      _selectedGender = <bool>[true, false];

      age.text = "";
      weight.text = "";
      height.text = "";
      result.text = "";
      resultContent.text = "";
      resultNum = 0.0;
    });
  } //clear




 errorSnackBar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('모두 입력하세요'),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }

}//END