import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;
  //int count = 0; 도 ok

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count 입니다.',
            ),

            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       count++;
      //     });
      //   },
      //

      //     ),
    );
  }
}
