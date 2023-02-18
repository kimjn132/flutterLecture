import 'package:attendance_app/login_page.dart';
import 'package:attendance_app/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendi'),
        actions: [
          IconButton(
            onPressed: () {
              //
            }, 
            icon: const Icon(
              Icons.group_add
            )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("data"), 
              accountEmail: Text("data"),
              ),
              Row(
                children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(const LogInPage());
                  
                }, 
                child: const Text("Log In")),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const SignInPage());
                    
                  }, 
                  child: const Text('Sign In'))

                ],
              )
          ],
        ),
      ),
    );
  }
}