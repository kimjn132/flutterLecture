import 'package:attendi_app/database/database_groups.dart' as groups;
import 'package:attendi_app/database/database_users.dart' as users;
import 'package:attendi_app/model/groups.dart';


import 'package:attendi_app/view/groupinsert_page.dart';
import 'package:attendi_app/view/login_page.dart';
import 'package:attendi_app/view/memberlist_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GroupListPage extends StatefulWidget {
  final String email;
  const GroupListPage({super.key, required this.email});

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage>
    with WidgetsBindingObserver {
  late AppLifecycleState _lastLifecycleState;
  late String tel;
  late groups.DatabaseHandler handler;
  late users.DatabaseHandler handler1;
  late String? email;
  late int uSeq1;
  late String result;
  late List list;

  late TextEditingController groupController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = '';
    tel = '';
    groupController = TextEditingController();
    uSeq1 = 0;
    email = '';
    list = [];
    
    handler = groups.DatabaseHandler();
    handler1 = users.DatabaseHandler();

    handler1.initializeDB().whenComplete(() async {
      list = await handler1.queryUsersEmail(email!);
      print(list);
      // setState(() {});
     });
    _initSharedPreferences();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print('detached'); //앱 지우면 2(앱이 완전 사라진 상태)
        break;
      case AppLifecycleState.resumed:
        print('resumed'); //끄기 직전 올리기 후 다시 눌러 실행
        break;
      case AppLifecycleState.inactive:
        _disposeSharedPreferences(); //앱 끄면 데이터 사라지기 : 그래서 detached에 지우는 메소드를 실행하면 이미 앱이 지워진 상태이므로 해당 메소드가 실행되지 못한다.
        print('inactive'); //끄기 직전 올리기
        break;
      case AppLifecycleState.paused:
        print('paused'); //앱 지우면 1
        break;
    }
    setState(() {
      _lastLifecycleState = state;
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendi'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const GroupInsertPage();
                })).then((value) => reloadData());
              },
              icon: const Icon(Icons.group))
        ],
      ),
      //drawer에 로그인한 해당 유저의 정보 보여주기
      drawer: Drawer(
        child: 
                
               ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(children: [
                          UserAccountsDrawerHeader(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 209, 124, 238),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                              accountName: Text(widget.email),
                              accountEmail: Text("g")),
                          ListTile(
                            onTap: () {
                              uSeq1 = list[index];
                              print(uSeq1);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.home),
                            title: const Text('로그인'),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //print(userId);
                                return const LogInPage();
                                //id, password 같이 보내주기(from _showDialog)
                              }));
                            },
                            trailing: const Icon(Icons.add),
                          ),
                          ListTile(
                            leading: const Icon(Icons.group),
                            title: const Text('그룹 모아보기'),
                            onTap: () {
                              //
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.people),
                            title: const Text('회원 모아보기'),
                            onTap: () {
                              //
                            },
                          ),
                          ListTile(
                            title: const Text('로그아웃'),
                            textColor: Colors.red,
                            onTap: () {
                              Navigator.of(context).pop();
                              _disposeSharedPreferences();

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LogInPage();
                                //id, password 같이 보내주기(from _showDialog)
                              }));
                            },
                          ),
                          ListTile(
                            title: const Text('회원탈퇴'),
                            textColor: Colors.red,
                            onTap: () {
                              //
                            },
                          ),
                        ]),
                      );
                    })
      ),
            
      
      
      //로그인한 해당 유저의 그룹 리스트 보여주기
      body: FutureBuilder(
          future: handler.queryGroups(uSeq1),
          builder:
              (BuildContext context, AsyncSnapshot<List<Groups>> snapshot) {
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
                        key: ValueKey<int>(snapshot.data![index].gSeq!),
                        onDismissed: (DismissDirection direction) async {
                          Groups groups = Groups(
                              gName: snapshot.data![index].gName,
                              gCategory: snapshot.data![index].gCategory,
                              gNote: snapshot.data![index].gNote,
                              cDate: snapshot.data![index].cDate);
                          await handler
                              .deleteGroups(snapshot.data![index].gSeq!);
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
                                      Text(snapshot.data![index].gName)
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
                                      Text(snapshot.data![index].gCategory)
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
                                      Text(snapshot.data![index].cDate)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MemberListPage(
                                  gSeq: snapshot.data![index].gSeq!,
                                  gName: snapshot.data![index].gName,
                                  gCategory: snapshot.data![index].gCategory,
                                  gNote: snapshot.data![index].gNote);
                            })).then((value) => reloadData());

                            print('ontap');
                            print(snapshot.data![index].gSeq!);
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
//function-----------------

//저장한 email, uSeq 가져와서 변수에 넣어주기
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = (prefs.getString('p_userid'))!;
      uSeq1 = (prefs.getInt('p_uSeq'))!;
      print('ttttt');
      print(email);
      print(uSeq1);
    });
  }

  //해당 유저의 그룹 리스트만 보여주기
  void reloadData() {
    setState(() {
      handler.queryGroups(uSeq1);
    });
  }

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  } //_disposeSharedPreferences

} //end
