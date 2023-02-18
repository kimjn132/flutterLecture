import 'package:flutter/material.dart';

import 'package:listview_app/model/animal_List.dart';
import 'package:listview_app/model/message.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  //AnimalList imagesAnimal = AnimalList();

  //late List<AnimalList> todoList;
  // late List<String> name1;
  // late List<String> image1;
  // late List<bool> flyAble1;
  late List<AnimalList> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList = [];

    // name1 = ['벌', '고양이', '젖소', '개', '여우', '원숭이', '돼지', '늑대'];
    // image1 = [
    //   'images/bee.png',
    //   'images/cat.png',
    //   'images/cow.png',
    //   'images/dog.png',
    //   'images/fox.png',
    //   'images/monkey.png',
    //   'images/pig.png',
    //   'images/wolf.png'
    // ];
    // flyAble1 = [true, false, false, false, false, false, false, false];

    // for (int i = 0; i < Message.name1.length; i++) {
    //   Message.todoList.add(AnimalList(
    //       imagesAnimal: Message.image1[i], name: Message.name1[i], flyAble: Message.flyAble1[i]));
    // }

    rebuildData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: Message.image1.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  //detail page에 넘겨주는 내용
                  //Message.imagesAnimal = todoList[position].imagesAnimal;
                  //Message.name = todoList[position].name;
                  //  Navigator.pushNamed(context, "/insert")
                  //   .then((value) => rebuildData());

                  _showDialog(context, position);
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(Message.image1[position]),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(Message.name1[position]),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

//function

  _showDialog(BuildContext context, int position) {
    showDialog(
        context: context,
        barrierDismissible: false, //user must tap the button only!
        builder: (BuildContext ctx) {
          return AlertDialog(
            //내용 쓰는 친구
            title: Text(Message.name),
            content: Text(
                "이 동물은 ${Message.flyAble1[position] == true ? '파충류' : '포유류'} 입니다."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('종료')),
            ],
          );
        }); //builder: 새로 만드는 친구
  }

//Message 배열에 기본값 넣어주고 그 배열에 add 해주면 따로 rebuild 안해줘도 된다.>>checkNew로 insert한 페이지 초기화만 해주면 됨!
  rebuildData() {
    if (Message.checkNew) {
      setState(() {
        // todoList.add(
        //   AnimalList(
        //       imagesAnimal: Message.imagesAnimal,
        //       name: Message.name,
        //       flyAble: Message.flyAble,
        //       ),
        // );
        Message.checkNew = false;
      });
    } else {}
  }
}
