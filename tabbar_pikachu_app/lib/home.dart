
import 'package:flutter/material.dart';
import 'package:tabbar_pikachu_app/first_page.dart';
import 'package:tabbar_pikachu_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin  {

  late TabController controller;
@override
  void initState() {
    
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
@override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar Test"),
      ),
      body: 
      TabBarView( //home에 2개 패이지 넣기 []
      controller: controller, //  내가 만든 컨트롤러 사용
          children: const [
            FirstPage(),
            SecondPage(),
          ],
          ),
        bottomNavigationBar: Container(
          color:  Colors.yellowAccent,  // 탭바 배경색 (container에 준다.)
          height: 100,  //크기
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red, 
            
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.alarm,
                ),
                text: "pompom",
              ),
              Tab(
                icon: Icon(
                  Icons.account_balance,
                  ),
                  text: "pompom",
              ),
            ]),
        ),
    );
  }
}
