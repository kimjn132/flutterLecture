import 'package:flutter/material.dart';
import 'package:sqlite_app_ex/message.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
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

//table page에서 static에 넣어 놓은 디테일 데이터 가져와서 텍스트필드에 넣어주기
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
        title: Text('Update for CRUD'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
      
                  print(code);
      
                  
                },
                child: const Text('수정'),
              ),
            ],
          ),
        ),
      ),
    );
  } //widget
}