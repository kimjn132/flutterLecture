import 'package:attendi_app/view/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {

  // String email = "";
  // String password = "";
  // String passwordConfirm = "";



  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _authentication = FirebaseAuth.instance;

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPwController = TextEditingController();
  TextEditingController userPwConfirmController = TextEditingController();
  TextEditingController userTelController = TextEditingController();

  late String email;
  late String password;
  late String tel;
  //late Timestamp joinDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userEmailController,
                decoration: const InputDecoration(
                  hintText: '이메일'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: userPwController,
                decoration: const InputDecoration(
                  hintText: '비밀번호'
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              TextField(
                controller: userPwConfirmController,
                decoration: const InputDecoration(
                  hintText: '비밀번호 확인'
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              TextField(
                controller: userTelController,
                decoration: const InputDecoration(
                  hintText: '전화번호 (선택사항)'
                ),
                keyboardType: TextInputType.phone,
              ),

              ElevatedButton(
                onPressed: () async {
                  email = userEmailController.text.toString();
                  password = userPwController.text.toString();
                  tel = userTelController.text.toString();
                  

                  

                  if (userEmailController.text.trim().isEmpty ||
                        userPwController.text.trim().isEmpty || userPwConfirmController.text.trim().isEmpty) {
                          errorSnackBar(context);
                        }else{
                          if(userPwController.text.trim() == userPwConfirmController.text.trim()){
                            //dialoge가 아이디 패스워드를 알아야 하므로 parameter에 넣어준다.
                            signInAction(email, password);
                          }else{
                            checkSnackBar(context);
                          }
                        }
                }, 
                child: const Text('회원가입'),
                ),
            ],
          ),
        ),
      ),
    );
  }//
//function------------------
  errorSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text('사용자 이메일과 암호를 모두 입력하세요'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    ));
}//errorSnackBar

// ------------------------------------------


  //원래는 전역변수에 있는 값이면 String 따로 안 넣어줘도 되지만(전역변수 이름 그대로 넣기), 전역변수에 없다면 String 변수명 이렇게 parameter로 넣어준다.
_showDialog(BuildContext context, String userEmail, String userPassword){
  showDialog(
    context: context, 
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('환영합니다!'),
      content: const Text('회원가입 완료되었습니다.'),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
          
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context){
              return const LogInPage();  //id, password 같이 보내주기(from _showDialog)
            }));
        },
        child: const Text('OK'))
      ],
    );
  },);
}//_showDialog

// -----------------------------------------

checkSnackBar(BuildContext context){
ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text('사용자 암호가 일치하지 않습니다'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    ));
}//CheckSnackBar

// -----------------------------------------
signInAction(String email, String password) async {

  try{
  final newUser = await _authentication.createUserWithEmailAndPassword(email: email, password: password);
    if(newUser.user != null){
      _showDialog(context, email, password);
    }
  }catch(e){
    print(e);
    checkSnackBar(context);
  }

}

}