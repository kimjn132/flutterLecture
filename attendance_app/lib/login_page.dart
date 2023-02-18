import 'package:attendance_app/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    pwController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendi"),
      ),
      body: Column(
        children: [
          Row(
            children: [
          const Text("Email"),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "abc@naver.com"
            ),
          ),
            ],
          ),
          Row(
            children: [
              const Text("Email"),
          TextField(
            controller: pwController,
            decoration: const InputDecoration(
              hintText: "8~10이상의 글자 수와 숫자의 조합"
            ),
          ),
            ],
          ),
          ElevatedButton(
          onPressed: () {
            Get.to(const MainPage());
          }, 
          child:const Text('로그인')
          ),
        ],
      ),
    );
  }

  //------------------------function---------------------




}//end