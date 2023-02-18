import 'package:flutter/material.dart';
import 'package:get/get.dart';

//command+shift+L
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late var id;
  late var name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = Get.parameters['id'] ?? '_';
    name = Get.parameters['name'] ?? '_';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('이전 화면'),
            ),
            Text('ID :$id'),
            Text('Name :$name'),
          ],
        ),
      ),
    );
  }
}
