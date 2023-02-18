import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetDart{
  late bool switchValue = true;

  Widget portraitMode(){
    return Stack(
      children: [
        Center(
          child: ElevatedButton(onPressed: () {
            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
          },
          child: const Text('Hello')),
        )
      ],
    );
  }//portraintMode



  Widget landscapeMode(){
    return Stack(
      children: [
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              
              child: ElevatedButton(onPressed: () {
                SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
              },
              child: const Text('Flutter')),
            ),
        Switch(
          value: switchValue, 
          onChanged:(value) {
            
            switchValue = value;

            switchTurn();
            
          }, )
          ],
        ),
      ],
    );
  }//landscape

switchTurn(){
 if (switchValue == true){
              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
              switchValue = false;
            }else{
              switchValue = true;
            }
}




}//class