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
    data = [];
    getJSONData();    //async>>바로 하단 build 실행한다.
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Test"),
      ),
      body: Center(
        child: data.isEmpty
        ?const Text('데이터가 없습니다.')
          //? const CircularProgressIndicator()
          : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return cardBuild(context, index);
            },)
      ),
    );
  }



  Widget cardBuild(BuildContext context, int index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Code :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(data[index]['code'],)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Code :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(data[index]['name'],)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Code :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(data[index]['dept'],)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Code :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(data[index]['phone'],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// --------function---------

Future<bool> getJSONData() async{
  //rest API로 데이터 가져오기
  var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');
  var response = await http.get(url); //http.get() 실행하고 나서 response에 넘겨 주는 것을 대기해라
  print(response.body);
  var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));   //json모양을 list로 바꾼다.
  List result = dataConvertedJSON['results'];
  setState(() {
  data.addAll(result);
  });
  return true;
}



}//END