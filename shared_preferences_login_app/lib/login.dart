import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  late AppLifecycleState _lastLifecycleState;
  //*****observer의 의미??>>앱의 여러 페이지가 있고 그  위에서 관찰가능(사용자 이용도 확인 가능)
//observer=supporter
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //***
    WidgetsBinding.instance.addObserver(this);
    //build 되기 전에 (화면 그리기 전에) observer, DB 연결 해줘야 된다. >> async
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    _initSharedPreferences(); //SharedPreference 초기화
    //shared에 개인정보,(비밀번호, 계좌정보 등등) 저장하면 안된다.
  }

// @override
//   void dispose() {
//     // TODO: implement dispose
//     WidgetsBinding.instance.addObserver(this);
//     super.dispose();
//   }

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
        print('inactive');  //끄기 직전 올리기 
        break;
      case AppLifecycleState.paused:
        _disposeSharedPreferences();  //앱 끄면 데이터 사라지기 : 그래서 detached에 지우는 메소드를 실행하면 이미 앱이 지워진 상태이므로 해당 메소드가 실행되지 못한다.
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
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(hintText: '사용자 ID'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: '사용자 password'),
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  _showDialog();
                },
                child: const Text('Log In'))
          ],
        ),
      ),
    );
  }

//------functions
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

  

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('환영 합니다'),
            content: const Text('신분이 확인 되었습니다'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _saveSharedPreferences();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SecondPage();
                      },
                    ));
                  },
                  child: const Text('OK'))
            ],
          );
        });
  } // _showDialog

  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', userIdController.text);
    pref.setString('p_password', passwordController.text);
  } //_saveSharedPreferences

  _disposeSharedPreferences()async{
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }//_disposeSharedPreferences


} // End