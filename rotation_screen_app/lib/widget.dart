import 'package:flutter/material.dart';

class WidgetDart{

Widget portraitMode(){
  return Stack(
    children: const [
      Center(
        child: Text('Portrait Mode'),
      )
    ],
  );

}// portraitMode

Widget landscapeMode(){
  return Stack(
    children: const [
      Center(
        child: Text('LandscapeMode'),
      )
    ],
  );

}// landscapeMode

}