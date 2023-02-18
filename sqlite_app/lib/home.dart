import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/insert.dart';
import 'package:sqlite_app/message.dart';
import 'package:sqlite_app/student.dart';
import 'package:sqlite_app/update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    getJsonData();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
        actions: [
          IconButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InsertPage();
                })).then((value) => refresh());
              },
              icon: const Icon(
                Icons.add_outlined,
              ))
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<Students>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                      onLongPress: () {
                        
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdatePage();
                        })).then((value) => refresh());
                      },
                  
                              
                        
                  child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          // key: Key(snapshot.data![index].code
                          // ),
                          onDismissed: (direction) {
                            setState(() {
                              handler.deleteStudents(snapshot.data![index].code);
                              //snapshot.data!.removeAt(index);
                            });
                          },
                          background: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.save,
              size: 36,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              size: 36,
              color: Colors.white,
            ),
          ),
                          child: Card(
                            child: Column(
                              //READ
                              children: [
                                Row(
                                  children: [
                                    const Text('Code :'),
                                    Text(snapshot.data![index].code)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('phone :'),
                                    Text(snapshot.data![index].phone)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('name :'),
                                    Text(snapshot.data![index].name)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('dept :'),
                                    Text(snapshot.data![index].dept)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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

// Future<bool> getJsonData() async {
    
    
//     List result = dataConvertedJSON['results'];
//     print(result.length);
//     setState(() {
//       data.addAll(result);
//     });
//     return true;
//   } //getJsonData

getJsonData() async {
    // Students firstStudent = Students(
    //     code: codeController.text,
    //     name: nameController.text,
    //     dept: deptController.text,
    //     phone: phoneController.text);
    Students firstStudent = Students(code: Message.code, name: Message.name, dept: Message.dept, phone: Message.phone);
    await handler.queryStudents();
    print(Message.code);
    
  } //getJsonData



refresh(){
  setState(() {
    
  });
}

}//end