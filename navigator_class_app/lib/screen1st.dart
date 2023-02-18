import 'package:flutter/material.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1st'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen 1st',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("back to Main")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2nd');
                },
                child: const Text("go to 2nd page")),
          ],
        ),
      ),
    );
  }
}
