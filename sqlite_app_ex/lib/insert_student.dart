import 'package:flutter/material.dart';
import 'package:sqlite_app_ex/database_handler.dart';
import 'package:sqlite_app_ex/student.dart';

class InsertStudent extends StatefulWidget {
  const InsertStudent({super.key});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late DatabaseHandler handler;

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

    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(()async{
      await getJsonData();
      setState(() {
        
      });
    });
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
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;
      
                  print(code);
                  print(name);
                  print(dept);
                  print(phone);
                 getJsonData();
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
    Students firstStudent = Students(code: codeController.text, name: nameController.text, dept: deptController.text, phone: phoneController.text);
    await handler.insertStudents(firstStudent);
    _showDialog(context);
  print(code);
  }//getJsonData

  _showDialog(BuildContext context){
    showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: const Text('입력 결과'),
        content: const Text('입력이 완료 되었습니다.'),
        actions: [
          TextButton(
            onPressed: () {
            Navigator.of(context).pop();
            Navigator.pop(context);
          }, child: const Text('OK'))
        ],
      );
    });
  }


}//end