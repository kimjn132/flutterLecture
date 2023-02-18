import 'dart:convert';
import 'package:crud_app/insert_student.dart';
import 'package:crud_app/message.dart';
import 'package:crud_app/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:http/http.dart' as http; //*************/

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late List data;

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String code1;
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
    data = [];
    
    code = '';
    name = '';
    dept = '';
    phone = '';
    
    code1 = '';
    index = 0;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InsertStudent();
                })).then((value) => getJsonData());
              },
              icon: const Icon(
                Icons.add_outlined,
              ))
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onLongPress: () {
                        Message.code = data[index]['code'];
                        Message.name = data[index]['name'];
                        Message.dept = data[index]['dept'];
                        Message.phone = data[index]['phone'];
                        print(Message.code);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateStudent();
                        })).then((value) => getJsonData());
                      },
                        child: SwipeActionCell(
                          key: ObjectKey(data[index]),
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                                title: 'delete',
                                onTap: (CompletionHandler handler) async {
                                  print(data);
                                  setState(() {
                                    //delete 실행
                                  deleteJsonData(data[index]['code']);
                                  //delete된 결과 보여주기
                                  data.removeAt(index);
                                  });
                                  
                                },

                                color: Colors.red),
                          ],
                        
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            //READ
                            children: [
                              Row(
                                children: [
                                  const Text('Code :'),
                                  Text(data[index]['code'])
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('phone :'),
                                  Text(data[index]['phone'])
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('name :'),
                                  Text(data[index]['name'])
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('dept :'),
                                  Text(data[index]['dept'])
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                        ),
                     
                      );
                }),
      ),
    );
  } //widget build

//function-----------
//delete
  deleteJsonData(String code1) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_flutter.jsp?code=$code1');
    await http.get(url);
    //code1 = data[index]['code'];
    print(code1);
    
  } //delete

  Future<bool> getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    // print(response.body);
    data.clear();
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    print(result.length);
    setState(() {
      data.addAll(result);
    });
    return true;
  } //getJsonData



} //end
