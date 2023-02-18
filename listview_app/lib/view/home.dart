import 'package:flutter/material.dart';
import 'package:listview_app/view/listview_insert.dart';
import 'package:listview_app/view/table_list.dart';

class Home extends StatefulWidget {
  //login page에서 id, password를 받아오기 위함
  final String id;
  final String pw;

//id, password 받아오기 위한 parameter값
  const Home({super.key, required this.id, required this.pw});

  @override
  State<Home> createState() => _HomeState();
}

// with: 상속 두개 이상 받기
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(
        length: 2,
        vsync:
            this); //this : 하단에 tab bar- vsync: this 의미는 home.dart와 해당 탭을 동기화 시키겠다.
    //length: 2 >> 두개 연결
  }

//앱 종료
  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose(); //앱 종료 전에 controller 끄겠다.

    super.dispose(); //앱 종료
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ListView Test"),
          centerTitle: false,
        ),
        body: TabBarView(
          //home에 2개 패이지 넣기 []
          controller: controller, //  내가 만든 컨트롤러 사용
          children: const [
            TableList(),
            Insert(),
          ],
        ),
        bottomNavigationBar: Container(
          //color:  Colors.yellowAccent,  // 탭바 배경색 (container에 준다.)
          height: 100, //크기
          child: TabBar(
              controller: controller,
              labelColor: Colors.blueAccent,
              indicatorColor: Colors.red,
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.looks_one,
                  ),
                  text: "One",
                ),
                Tab(
                  icon: Icon(
                    Icons.looks_two,
                  ),
                  text: "Two",
                ),
              ]),
        ),
      ),
    );
  }
}
