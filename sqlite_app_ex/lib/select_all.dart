import 'package:flutter/material.dart';
import 'package:sqlite_app_ex/database_handler.dart';
import 'package:sqlite_app_ex/student.dart';

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late DatabaseHandler handler;
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
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(()async{
      await addstudents();
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<Students>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Code : ${snapshot.data![index].code}')
                        ],
                      )
                    ],
                  ),
                );
              });
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
//future


  
}