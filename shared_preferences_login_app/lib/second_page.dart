import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userId;
  late String password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = '';
    password = '';
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Id와 Password'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('UserId : $userId'),
            Text('Password : $password'),
          ],
        ),
      ),
    );
  }

//function-------

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = (prefs.getString('p_userid'))!;
      password = (prefs.getString('p_password'))!;
    });
  }
}//end