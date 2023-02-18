import 'package:flutter/material.dart';
import 'package:todoist_pickerview_app/model/message.dart';
import 'package:todoist_pickerview_app/model/todo_list.dart';
import 'package:todoist_pickerview_app/view/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late List<TodoList> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    todoList = [];
    
   //rebuildData();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main View"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/insert").then((value) => rebuildData());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Message.workList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Message.workList1 = Message.workList[index];
                  Message.imagePath1 = Message.imagePath[index];

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(Message.imagePath[index]),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(Message.workList[index]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
//function

rebuildData(){
  setState(() {
    
  Message.workList = Message.workList;
  Message.imagePath = Message.imagePath;
  });
}



}//end
