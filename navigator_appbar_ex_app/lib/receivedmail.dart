import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
        child: Column(
          children: [
            Text('유비에게서 온 메일'),
            Text('관우에게서 온 메일'),
            Text('장비에게서 온 메일'),
          ],
        ),
      ),
    );
  }
}