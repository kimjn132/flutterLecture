import 'package:flutter/material.dart';
import '../model/message.dart';
import '../model/todo_list.dart';
import 'detail.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  late List<TodoList> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];

    todoList.add(
      TodoList(
        imagePath: 'images/cart.png',
        workList: '책 구매',
        icons: const Icon(Icons.bookmark),
      ),
    );
    todoList.add(
      TodoList(
        imagePath: 'images/clock.png',
        workList: '약속',
        icons: const Icon(Icons.alarm),
      ),
    );
    todoList.add(
      TodoList(
        imagePath: 'images/pencil.png',
        workList: '스터디 준비',
        icons: const Icon(Icons.book_outlined),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              //**********************
              //
              Navigator.pushNamed(context, "/insert")
                  .then((value) => rebluildData());
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            // position: index
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[position].workList;
                Message.imagePath = todoList[position].imagePath;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detail(),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: todoList[position].icons,
                    ),
                    Text(todoList[position].workList),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //function----------
  rebluildData() {
    if (Message.checkNew) {
      setState(() {
        todoList.add(
          TodoList(
            imagePath: Message.imagePath,
            workList: Message.workList,
            icons: const Icon(Icons.book),
          ),
        );
        Message.checkNew = false;
      });
    } else {}
  }
}// END
