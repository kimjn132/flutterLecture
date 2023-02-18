import 'package:flutter/material.dart';
import 'package:listview_app/model/animal_List.dart';
import 'package:listview_app/model/message.dart';

enum Species { yang, pa, po }

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  //사용자 입력 텍스트 필드(동물 이름)
  late TextEditingController insertName;

  //사용자 입력한 동물 관련 정보 담는 배열 변수
  //late List<AnimalList> todoList;

  // flyAble 체크 박스 체크 표시
  late bool isChecked;

  late String imagePath;

  late List<String> name1;
  late List<String> image1;
  late List<bool> flyAble1;
  late List<AnimalList> todoList;

  //radiocheck 1개만 checked 되도록
  Species? _species = Species.yang;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Message.todoList = [];
    imagePath = '';
    insertName = TextEditingController();
    isChecked = false;

// name1 = ['벌', '고양이', '젖소', '개', '여우', '원숭이', '돼지', '늑대'];
//     image1 = [
//       'images/bee.png',
//       'images/cat.png',
//       'images/cow.png',
//       'images/dog.png',
//       'images/fox.png',
//       'images/monkey.png',
//       'images/pig.png',
//       'images/wolf.png'
//     ];
//     flyAble1 = [true, false, false, false, false, false, false, false];

    // Message.todoList.add(AnimalList(
    //     imagesAnimal: imagePath, name: insertName.text, flyAble: isChecked));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("ListView Test"),
        //   centerTitle: false,
        // ),
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: insertName,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('영장류'),
                    leading: Radio(
                      value: Species.yang,
                      groupValue: _species,
                      onChanged: (value) {
                        setState(() {
                          _species = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('파충류'),
                    leading: Radio(
                      value: Species.pa,
                      groupValue: _species,
                      onChanged: (value) {
                        setState(() {
                          _species = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('포유류'),
                    leading: Radio(
                      value: Species.po,
                      groupValue: _species,
                      onChanged: (value) {
                        setState(() {
                          _species = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("날 수 있나요?"),
                const SizedBox(
                  width: 40,
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Message.image1.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      imagePath = Message.image1[position];
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(Message.image1[position])),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text("동물 추가하기"),
            )
          ],
        ),
      ),
    ));
  }
//function

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //user must tap the button only!
        builder: (BuildContext ctx) {
          return AlertDialog(
            //내용 쓰는 친구
            title: const Text('동물 추가하기'),
            content: Text(
                "이 동물은 ${insertName.text} 입니다. 또 동물의 종류는 ${_species == Species.yang ? Message.species = '양서류' : _species == Species.pa ? Message.species = '파충류' : Message.species = '포유류'} 입니다. \n 이 동물을 추가하시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    addList();

                    Navigator.of(ctx).pop();
                  },
                  child: const Text('예')),
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text("아니오")),
            ],
          );
        }); //builder: 새로 만드는 친구
  }

  addList() {
    Message.image1.add(imagePath);
    Message.name1.add(insertName.text.trim());
    Message.flyAble1.add(isChecked);
  } //addList

}//END
