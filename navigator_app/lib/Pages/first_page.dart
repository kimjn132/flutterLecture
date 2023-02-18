import 'package:flutter/material.dart';
import 'package:navigator_app/Pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(//똑같은 모양으로 새컨 페이지가 뜬다.(퍼스트 페이지는 유지됨)
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ),
            );
          },
          child: const Text('Go to the second page'),
        ),
      ),
    );
  }
}
