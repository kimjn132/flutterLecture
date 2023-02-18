import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail view'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Message.imagePath,
              width: 100,
              height: 100,
            ),
            Text(
              Message.workList,
            ),
          ],
        ),
      ),
    );
  }
}
