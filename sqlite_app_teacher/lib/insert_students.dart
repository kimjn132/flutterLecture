import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/students.dart';

class InsertStudents extends StatefulWidget {
  const InsertStudents({super.key});

  @override
  State<InsertStudents> createState() => _InsertStudentsState();
}

class _InsertStudentsState extends State<InsertStudents> {
  late DatabaseHandler handler;

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String code;
  late String name;
  late String dept;
  late String phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Insert for CRUD"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: codeController,
                      decoration: const InputDecoration(labelText: '학번을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: '성명을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: deptController,
                      decoration: const InputDecoration(labelText: '전공을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: '전화번호을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        code = codeController.text.toString();
                        name = nameController.text.toString();
                        dept = deptController.text.toString();
                        phone = phoneController.text.toString();
                        Students students = Students(
                            code: code, name: name, dept: dept, phone: phone);
                        // List<Students> listOfStudetns = [students];
                        await handler.insertStudents(students);
                        _showDialog(context);
                      },
                      child: Text('입력')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} // _InsertStudentState

_showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("입력 결과"),
          content: const Text("입력이 완료 되었습니다."),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context); // Main화면으로 이동
              },
              child: const Text('OK'),
            ),
          ],
        );
      }
      
      );
}
