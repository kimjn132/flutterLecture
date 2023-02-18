
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  //**********/

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=[];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
        ?const Text('데이터가 없습니다') 
        : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return cardBuild(context, index);
          },),
      ),
    );
  }


Widget cardBuild(BuildContext context, int index){
  return Card(
    color: index % 2 == 0 ? Colors.pink[100] : Colors.yellow[100],
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 100,
            child: Image.network(data[index]["image"])),
        ),
        Text(data[index]["title"])
      ],
    ),
  );
}


//function

Future<bool> getJSONData() async{
  //rest API
  var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
  var response = await http.get(url); //await하는 이유는 페이지가 다 만들어지는 시간까지 잠시 대기 하자 
  print(response.body);
  var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  List result = dataConvertedJSON["results"]; //json 리스트의 제목 >>print했을 때 나오는 제일 처음 글자
  setState(() {
    data.addAll(result);
  });

  return true;
}

}//END