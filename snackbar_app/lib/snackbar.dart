import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'ElevatedButton is Clicked.',
              ),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.red,
            ),
          );
        },
        child: const Text('SnackBar Button'),
      ),
    );
  }
}
