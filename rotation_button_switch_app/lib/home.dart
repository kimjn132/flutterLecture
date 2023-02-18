import 'package:flutter/material.dart';
import 'package:rotation_button_switch_app/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WidgetDart wd = WidgetDart();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if(orientation == Orientation.landscape){
          return wd.landscapeMode();
        }else{
          return wd.portraitMode();

        }
      },)
    );
  }

  
}
