import 'package:attendance_app/login_page.dart';
import 'package:attendance_app/main_page.dart';
import 'package:attendance_app/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      getPages: [
        GetPage(
          name: "/login", 
          page: () => const LogInPage(),),
          GetPage(
            name: '/signin', 
            page: () => const SignInPage(),)
      ],
    );
  }
}
