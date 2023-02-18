
import 'package:flutter/material.dart';
import 'package:todoist_pickerview_app/model/message.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(Message.imagePath1),
            Text(Message.workList1),
          ],
        ),
      ),
    );
  }
}