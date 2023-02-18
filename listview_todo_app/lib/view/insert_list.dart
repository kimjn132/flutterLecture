import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;

  //스위치
  late bool switchValue1;
  late bool switchValue2;
  late bool switchValue3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //인스턴스 만든 거임
    textEditingController = TextEditingController();
    //default값으로 기본 switch on
    switchValue1 = true;
    switchValue2 = false;
    switchValue3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  Switch(
                    value: switchValue1,
                    onChanged: (value) {
                      setState((() {
                        //화면 바꾸려면 setState 해줘야함
                        switchValue1 = value;

                        // switchValue1 = value;
                        settingSwitch(switchValue1);
                      }));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/cart.png',
                    width: 40,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  Switch(
                    value: switchValue2,
                    onChanged: (value) {
                      setState((() {
                        switchValue1 = value;
                        //화면 바꾸려면 setState 해줘야함
                        settingSwitch(switchValue1);
                        // switchValue2 = value;
                      }));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/clock.png',
                    width: 40,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  Switch(
                    value: switchValue3,
                    onChanged: (value) {
                      setState((() {
                        switchValue1 = value;
                        //화면 바꾸려면 setState 해줘야함
                        settingSwitch(switchValue3);
                        // switchValue2 = value;
                      }));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/pencil.png',
                    width: 40,
                  )
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isNotEmpty) {
                      addList();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          ),
        ),
      ),
    );
  } //widget(build)

  //------- functions
  addList() {
    //사용자 입력 목록
    Message.workList = textEditingController.text.trim();
    //사용자 체크 이미지 목록
    switchValue1 == true
        ? Message.imagePath = 'images/cart.png'
        : switchValue2 == true
            ? Message.imagePath = 'images/clock.png'
            : Message.imagePath = 'images/pencil.png';

    Message.checkNew = true;
  } //addList

  settingSwitch(bool value) {
    setState(() {
      // if()
      if (value) {
        switchValue3 = value;
        switchValue1 = false;
        switchValue2 = false;
      } else if (value == false &&
          switchValue1 == false &&
          switchValue2 == false) {
        switchValue1 = true;
        switchValue2 = false;
        switchValue3 = false;
      }
    });
  }
} //END

