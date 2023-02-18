import 'package:collection_view_label_app/model/message.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //late List<String> heroList = [];
  //late List<String> images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //나중에 DB에서 데이터 불러오는 곳
    

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert').then((value) => rebuild());
              },
              icon: const Icon(Icons.add_outlined)),
        ],
      ),
      body: GridView.builder(
        itemCount: Message.heroList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //한 줄에 3개씩
          crossAxisSpacing: 10, //
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( // 테두리
              color: Colors.grey,
              child: Card(
                color: Colors.yellow, //카드 배경색 
                child: Center(
                  child: Column(
                    children: [
                  Text(
                    Message.heroList[index]
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(Message.imageList[index])),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
//function
rebuild(){
  setState(() {
  Message.heroList;
  Message.imageList;
    
  });
}

}//end
