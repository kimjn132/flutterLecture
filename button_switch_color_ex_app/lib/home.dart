import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late bool switchValue;
  late Color _color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchValue = false;
    _color = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changed Button color on Switch'),
        centerTitle: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _onClick();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _color,
            ),
            child: Text('Flutter'),
          ),
          Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
              }),
        ],
      )),
    );
  }
//function

  _onClick() {
    setState(() {
      if (switchValue == true) {
        switchValue = false;
        _color = Colors.blue;
      } else {
        switchValue = true;
        _color = Colors.red;
      }
    });
  }
}//end