import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2nd'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen 2nd',
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
                  Navigator.pushNamed(context, '/1st');
                },
                child: const Text("go to 1st page")),
          ],
        ),
      ),
    );
  }
}
