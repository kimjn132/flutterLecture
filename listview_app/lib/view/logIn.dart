import 'package:flutter/material.dart';
import 'package:listview_app/view/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
//id, password propert
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/login.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(labelText: '사용자 ID 입력하세요'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: '패스워드를 입력하세요'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (userIdController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      if (userIdController.text.trim() == 'root' &&
                          passwordController.text.trim() == 'qwer1234') {
                        _logInDialog(context, userIdController.text,
                            passwordController.text);
                      } else {
                        wrongSnackBar(context);
                      }
                    }
                  },
                  child: const Text('Log In'))
            ],
          ),
        ),
      ),
    );
  }
//function ----------------------------

//id, password 입력 안 했을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

//id, password 입력 실패
  wrongSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 ID와 암호가 일치하지 않습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

//id, password 입력 성공
  _logInDialog(BuildContext context, String userId, String password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영합니다'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home(id: userId, pw: password);
                    },
                  ));
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }
} //END
