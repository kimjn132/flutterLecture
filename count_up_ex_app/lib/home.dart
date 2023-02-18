import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

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
        title: const Text('Count Up & Down'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $count 입니다.'),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count = count - 1;
                    });
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
