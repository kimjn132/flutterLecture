import 'package:flutter/material.dart';
import 'package:rotation_screen_app/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WidgetDart wd = WidgetDart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      //orientationBuilder : 틀을 만들어준다.(builder는 항상 context, index가 있다.)여기서는 index>>방향
      body: OrientationBuilder(builder: (context, orientation) {
        if(orientation == Orientation.portrait){
          return wd.portraitMode() ;
        }else{
          return wd.landscapeMode();
        }
      },),
    );
  }
// -----------------------function---------------------------

// Widget portraitMode(){
//   return Stack(
//     children: const [
//       Center(
//         child: Text('Portrait Mode'),
//       )
//     ],
//   );

// }// portraitMode

// Widget landscapeMode(){
//   return Stack(
//     children: const [
//       Center(
//         child: Text('LandscapeMode'),
//       )
//     ],
//   );

// }// landscapeMode




}//ENd