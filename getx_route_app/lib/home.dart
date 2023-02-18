import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/second.dart';
import 'package:getx_route_app/third.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Roudte관리'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Navigation'),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondPage(),
                      arguments: ["First", "Second"], //다음 페이지에 보내줄 값들 
                      transition: Transition.zoom,  //다음 화면 보여주는 방식
                      duration: const Duration(seconds: 1)); //화면 open 걸리는 시간
                },
                child: const Text('화면 이동')),
            ElevatedButton(
                onPressed: () {
                  Get.to(const ThirdPage(),
                  );
                },
                child: const Text('화면 이동2')),
            ElevatedButton(
                onPressed: () async {
                  var returnValue = await Get.to(
                    const SecondPage(),
                    arguments: ["First", "Second"],
                  );
                  Get.snackbar("Return value", "${returnValue}",
                      backgroundColor: Colors.yellow);
                },
                child: const Text('화면 이동3')),
            const Text('SnackBar'),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "SnackBar",
                  "Message",
                  backgroundColor: Colors.yellowAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text('SnackBar'),
            ),
            const Text('Dialog'),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Dialog',
                    middleText: 'Message',
                    barrierDismissible: false, //false 하면 뒷배경 눌러도 dialog 안꺼짐
                    backgroundColor: Colors.amber,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Edit'))
                    ]);
              },
              child: const Text('Dialog'),
            ),
            const Text('Bottom Sheet'),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    height: 300,
                    color: Colors.purple[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Text Line1'),
                        Text('Text Line2'),
                      ],
                    ),
                  ));
                },
                child: const Text('Bottom Sheet')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/third?id=root&name=루트');
                },
                child: const Text('화면이동4')),
          ],
        ),
      ),
    );
  }
}
