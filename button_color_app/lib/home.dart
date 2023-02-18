

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _buttonState;
  late Color _color;
  late String _text;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buttonState = 'ON';
    _color = Colors.blue;
    _text = 'Hello';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chang button color&text'),
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
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(10),
                )
              ),
              child: Text(_text),
              ),
          ],
        ),
      ),
    );
  }
//function
_onClick(){
  setState(() {
    if(_buttonState == 'OFF'){
      _buttonState = 'ON';
      _color = Colors.blue;
      _text = 'Hello';
    }else{
      _buttonState = 'OFF';
      _color = Colors.orange;
      _text = 'Flutter';
    }
  });
}

  
}