import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and Push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Move the 2nd page.'),
        ),
      ),
    );
  }

//function

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //user must tap the button only!
        builder: (BuildContext ctx) {
          return AlertDialog(
            //내용 쓰는 친구
            title: const Text('Page 이동'),
            content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/1st');
                  },
                  child: Text('Page 이동'),
                ),
              ),
            ],
          );
        }); //builder: 새로 만드는 친구
  }
} //end
