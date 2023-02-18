import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app_ex/second_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
} //Home

class _HomeState extends State<Home> with WidgetsBindingObserver {
//property
late AppLifecycleState _lastLifecycleState;
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addObserver(this);
    //instance: new 사용 안한다.
    userIdController = TextEditingController();
    passwordController = TextEditingController();
     _initSharedPreferences(); //SharedPreference 초기화
  } //initState

@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print('detached');  //앱 지우면 2(앱이 완전 사라진 상태)
        break;
      case AppLifecycleState.resumed:
        print('resumed'); //끄기 직전 올리기 후 다시 눌러 실행
        break;
      case AppLifecycleState.inactive:
        _disposeSharedPreferences();  //앱 끄면 데이터 사라지기 : 그래서 detached에 지우는 메소드를 실행하면 이미 앱이 지워진 상태이므로 해당 메소드가 실행되지 못한다.
        print('inactive');  //끄기 직전 올리기 
        break;
      case AppLifecycleState.paused:
        print('paused');  //앱 지우면 1
        break;
        
    }
    setState(() {
      
    _lastLifecycleState = state;
    });
    super.didChangeAppLifecycleState(state);
  }


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
                        }else{
                          checkSnackBar(context);
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
          _saveSharedPreferences();
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context){
              return SecondPage();  //id, password 같이 보내주기(from _showDialog)
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


_initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance(); //userId 저장한 것 보여주겠다.
    setState(() {
      userIdController.text =
          (prefs.getString('p_userid') ?? ""); //** */ ?? 데이터가 없으면 ""이라는 뜻
      passwordController.text = (prefs.getString('p_password') ?? "");
    });

    print(userIdController.text);
    print(passwordController.text);
  } //_initsharedpreference

_saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', userIdController.text);
    pref.setString('p_password', passwordController.text);
  } //_saveSharedPreferences

  _disposeSharedPreferences()async{
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }//_disposeSharedPreferences

// -----------------------------------------


}//END
