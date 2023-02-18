import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/message.dart';
import 'package:sqlite_app/student.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
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
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
    code = '';
    name = '';
    dept = '';
    phone = '';

    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert for CRUD'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '학번을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '이름을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: deptController,
                  decoration: InputDecoration(labelText: '전공을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: '전화번호를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Message.code = codeController.text;
                 Message.name = nameController.text;
                  Message.dept = deptController.text;
                  Message.phone = phoneController.text;

                  print(code);
                  print(name);
                  print(dept);
                  print(phone);
                  handler.initializeDB().whenComplete(() async {
                    await getJsonData();
                    setState(() {});
                  });
                },
                child: const Text('입력'),
              ),
            ],
          ),
        ),
      ),
    );
  } //widget

//function
  getJsonData() async {
    Students firstStudent = Students(
        code: codeController.text,
        name: nameController.text,
        dept: deptController.text,
        phone: phoneController.text);

        
    await handler.insertStudents(firstStudent);
    _showDialog(context);
    print(code);
  } //getJsonData

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('입력 결과'),
            content: const Text('입력이 완료 되었습니다.'),
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
}//end