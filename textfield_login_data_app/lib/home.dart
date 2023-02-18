import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
} //Home

class _HomeState extends State<Home> {
//property
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //instance: new 사용 안한다.
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  } //initState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar > key값, AppBar() > 생성자(value값)
      appBar: AppBar(
        //생성자 value 안에 또 생성자 넣은 방식
        title: const Text('Log In'),
      ),
      //singlechildscrollview: 키보드 올라올 때 화면 내려서 볼 수 있다.
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('images/login.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: '패스워드를 입력하세요',
                  ),
                  obscureText: true,  //password 글자 안보이게 
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (userIdController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                        errorSnackBar(context);
                      }else{
                        if(userIdController.text.trim() == 'root' && passwordController.text.trim() == 'qwer1234'){
                          //dialoge가 아이디 패스워드를 알아야 하므로 parameter에 넣어준다.
                          _showDialog(context, userIdController.text, passwordController.text);
                        }
                      }
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
//---------Functions

// -----------------------------------------
// Desc : id와 password를 입력 안했을 경우
// Date : 2022.12.20.
errorSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text('사용자 Id와 암호를 입력하세요'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    ));
}//errorSnackBar

// ------------------------------------------


  //원래는 전역변수에 있는 값이면 String 따로 안 넣어줘도 되지만(전역변수 이름 그대로 넣기), 전역변수에 없다면 String 변수명 이렇게 parameter로 넣어준다.
_showDialog(BuildContext context, String userId, String password){
  showDialog(
    context: context, 
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('환영합니다!'),
      content: const Text('신분이 확인 되었습니다.'),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context){
              return SecondPage(id: userId, pw: password);  //id, password 같이 보내주기(from _showDialog)
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
    content: Text('사용자 Id와 암호가 일치하지 않습니다'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    ));
}//CheckSnackBar

// -----------------------------------------


}//END
