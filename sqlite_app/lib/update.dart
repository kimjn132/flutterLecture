import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/message.dart';
import 'package:sqlite_app/student.dart';


class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late DatabaseHandler handler;

  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
handler = DatabaseHandler();
     codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

// //table page에서 static에 넣어 놓은 디테일 데이터 가져와서 텍스트필드에 넣어주기
    code = Message.code;
    name = Message.name;
    dept = Message.dept;
    phone = Message.phone;

    codeController.text = code;
    nameController.text = name;
    deptController.text = dept;
    phoneController.text = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '학번 입니다'),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '성명을 수정하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: deptController,
                  decoration: InputDecoration(labelText: '전공을 수정하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: '전화번호를 수정하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;
      
                  Message.name = name;
                  Message.dept = dept;
                  Message.phone = phone;
                  print(Message.name);
                  handler.initializeDB().whenComplete(() async {
                    await updateJsonData();
                    setState(() {});
                  });
                
                },
                child: const Text('수정'),
              ),
          ],
        ),
      )
    );
  }

//update
  updateJsonData() async {
    // Students firstStudent1 = Students(
    //     code: codeController.text,
    //     name: nameController.text,
    //     dept: deptController.text,
    //     phone: phoneController.text);
    Students firstStudents = Students(code: codeController.text, name: nameController.text, dept: deptController.text, phone: phoneController.text);

        
    await handler.updateStudents(firstStudents);
    _showDialog(context);
    print(code);
  } //getJsonData

//dialog
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('수정 결과'),
            content: const Text('수정이 완료 되었습니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

}