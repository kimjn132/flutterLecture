import 'package:attendance_app/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    pwController = TextEditingController();
    pwConfirmController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendi'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            TextField(
              controller: pwController,
              decoration: const InputDecoration(
                hintText: '패스워드 (8글자 이상 입력하세요.)'
              ),
            ),
            TextField(
              controller: pwConfirmController,
              decoration: const InputDecoration(
                hintText: '비밀번호 확인'
              ),
            ),
          ElevatedButton(
            onPressed: () {
              Get.to(const MainPage());
            }, 
            child: const Text('회원가입'))

          ],
        ),
      ),
    );
  }
}