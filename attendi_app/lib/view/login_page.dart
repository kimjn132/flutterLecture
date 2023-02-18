import 'package:attendi_app/database/firebase_users.dart';
import 'package:attendi_app/model/users.dart';
import 'package:attendi_app/view/grouplist_page.dart';
import 'package:attendi_app/view/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _HomeState();
}

class _HomeState extends State<LogInPage> {
  // late DatabaseHandler handler;
  final db = FirebaseFirestore.instance;

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPwController = TextEditingController();

  late int number;
  late String email;
  late String password;
  late String? tel;
  late bool test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //handler = DatabaseHandler();

    number = 0;
    email = '';
    password = '';
    tel = '';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userEmailController,
                  onChanged: ((email) {}),
                  decoration: const InputDecoration(
                    hintText: '사용자 ID를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userPwController,
                  decoration: const InputDecoration(
                    hintText: '사용자 패스워드를 입력하세요',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          //로그인 버튼 누르면 실행되는 아이들
                          //유저의 이메일과 패스워드 넣어서 해당 유저의 정보 저장하기
                          // Users users =
                          //     Users(uSeq: number, email: email, password: password);

                          email = userEmailController.text.trim();
                          password = userPwController.text.trim();
                          // var loginin = await db.collection('users').doc().snapshots();
                          // var keyk = await db.collection('users').snapshots().

                          //print(loginin.data());

                          //sqlite에서 true인지, false인지 test 변수에 bool값 넣어서 로그인 ok여부 체크
                          // test = await handler.loginUsers(users);
                          //사용자가 입력 안했을 경우
                          // if (userEmailController.text.trim().isEmpty ||
                          //     userPwController.text.trim().isEmpty) {
                          //   errorSnackBar(context);
                          // //사용자가 모두 입력 했을 경우
                          // } else {
                          //   //모두 입력하고 email, passoword 모두 맞을 경우
                          //   if () {
                          //   //모두 입력했지만 email, password 둘 중 하나가 다른 경우

                          //   } else {
                          //     checkSnackBar(context);
                          //   }
                          // }

                          //해당 저장한 유저의 uSeq 불러오기 실행
                          //singleUser();

                          loginCheck(context, email, password);
                        },
                        child: const Text('로그인')),
                  ),

                  //회원가입
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignInPage(); //id, password 같이 보내주기(from _showDialog)
                          }));
                        },
                        child: const Text('회원가입')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------------------------
// Desc : id와 password를 입력 안했을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 Id와 암호를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } //errorSnackBar

// ------------------------------------------

  //로그인 성공 후 dialogue: 확인 버튼 누르면 groupList 페이지로 넘어간다.
  //원래는 전역변수에 있는 값이면 String 따로 안 넣어줘도 되지만(전역변수 이름 그대로 넣기), 전역변수에 없다면 String 변수명 이렇게 parameter로 넣어준다.
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영합니다!'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //사용자 email, uSeq 저장.
                  _saveSharedPreferences();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GroupListPage(email: userEmailController.text);
                    //id, password 같이 보내주기(from _showDialog)
                  }));
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  } //_showDialog

//login 후 회원 이메일 및 SeqNumber 저장
  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', userEmailController.text);
    pref.setInt('p_uSeq', number);
  } //_saveSharedPreferences

//사용자 아이디 비번 일치하지 않을 때 snackBar
  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 Id와 암호가 일치하지 않습니다'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } //CheckSnackBar

// -----------------------------------------

  loginCheck(BuildContext context, String email, String password) async {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final login = Provider.of<Users>(context, listen: false);

    login..setEmail(email);
    login.setPassword(password);

    await authClient
        .loginWithEmail(login.email, login.password)
        .then((loginStatus) {
      if (loginStatus == AuthStatus.loginSuccess) {
        _showDialog(context);
      } else {
        checkSnackBar(context);
      }
    });
  } // loginCheck

} //end
