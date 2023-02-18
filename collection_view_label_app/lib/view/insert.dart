import 'package:collection_view_label_app/model/message.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  TextEditingController insertController = TextEditingController();
  CarouselController buttonCarouselController = CarouselController();
  late String imageInsert = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insertController = TextEditingController();
    imageInsert = 'images/bee.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인물 추가'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
           Stack(children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      //autoPlay: true,
                      height: 200.0,
                      viewportFraction: 0.8,
                      onPageChanged: (position, reason) {
                        imageInsert = Message.imageList[position];
                        //print(imageInsert);
                      },
                    ),
                    items: Message.imageList.map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(index)),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          buttonCarouselController.previousPage();
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          buttonCarouselController.nextPage();
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  ),
                ]
              
            ),
            TextField(
              controller: insertController,
              decoration: const InputDecoration(labelText: '인물을 추가 하세요'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              letInsert();
            }, child: const Text('추가')),
          ]),
        ),
      ),
    );
  }
//function---------------

letInsert(){
//  Message.insertImage = imageInsert;
//  Message.insertHero = insertController.text;

setState(() {
  
Message.imageList.add(imageInsert);
Message.heroList.add(insertController.text);
});
print(imageInsert);
print(insertController.text);
}


} //End
