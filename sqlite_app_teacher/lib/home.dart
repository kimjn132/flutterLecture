import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/insert_students.dart';
import 'package:sqlite_app/students.dart';
import 'package:sqlite_app/update_students.dart';

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
    // 1st Action
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      await addStudents();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InsertStudents();
              })).then((value) => reloadData());
            },
          )
        ],
      ),
      body: 
      FutureBuilder(
          future: handler.queryStudents(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.delete_forever),
                        ),
                        key: ValueKey<int>(snapshot.data![index].id!),
                        onDismissed: (DismissDirection direction) async {
                          await handler
                              .deleteStudents(snapshot.data![index].id!);
                          setState(() {
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        child: GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Code :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(snapshot.data![index].code)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Name :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(snapshot.data![index].name)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Dept :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(snapshot.data![index].dept)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Phone :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(snapshot.data![index].phone)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UpdateStudents(
                                  rcode: snapshot.data![index].code,
                                  rname: snapshot.data![index].name,
                                  rdept: snapshot.data![index].dept,
                                  rphone: snapshot.data![index].phone);
                            })).then((value) => reloadData());
                          },
                        ));
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  // Test용 Insert Action
  Future<int> addStudents() async {
    Students firstStudent =
        Students(code: '1111', name: '유비', dept: '컴퓨터공학과', phone: '1111');
    await handler.insertStudents(firstStudent);
    Students secondStudent =
        Students(code: '2222', name: '관우', dept: '심리학과', phone: '2222');
    await handler.insertStudents(secondStudent);
    Students thirdStudent =
        Students(code: '3333', name: '장비', dept: '시각디자인학과', phone: '3333');
    await handler.insertStudents(thirdStudent);

    // List<Students> listOfStudents = [firstStudent, secondStudent, thirdStudent];
    // return await handler.insertStudents(listOfStudents);
    return 0;
  }

  void reloadData() {
    setState(() {
      handler.queryStudents();
    });
  }
} // _MyHomePageState
