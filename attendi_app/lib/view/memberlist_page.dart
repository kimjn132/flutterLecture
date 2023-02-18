import 'package:attendi_app/database/database_members.dart';
import 'package:attendi_app/model/members.dart';
import 'package:attendi_app/view/attendCheck.dart';
import 'package:attendi_app/view/memberdetail_page.dart';
import 'package:attendi_app/view/memberinsert_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberListPage extends StatefulWidget {
  final int gSeq;
  final String gName;
  final String gCategory;
  final String? gNote;

  const MemberListPage(
      {super.key,
      required this.gSeq,
      required this.gName,
      required this.gCategory,
      this.gNote});

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  late DatabaseHandler handler;
  late int uSeq1;
  
  late String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    uSeq1 = 0;
    
    _initSharedPreferences();
    test = '';
    //reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('memberList'),
        actions: [
          IconButton(
              onPressed: () {
                _saveSharedPreferences();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const InsertMemberPage();
                })).then((value) => reloadData());
              },
              icon: const Icon(Icons.group))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(widget.gName),
              Text(widget.gCategory),
              Text(test),
              FutureBuilder(
                  future: handler.queryMembers(uSeq1, widget.gSeq),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Members>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: const Icon(Icons.delete_forever),
                                ),
                                key: ValueKey<int>(snapshot.data![index].mSeq!),
                                onDismissed:
                                    (DismissDirection direction) async {
                                  Members members = Members(
                                      mName: snapshot.data![index].mName,
                                      mTel: snapshot.data![index].mTel,
                                      mNote: snapshot.data![index].mNote,
                                      eDate: snapshot.data![index].eDate);
                                  await handler.deleteMembers(
                                      snapshot.data![index].mSeq!);
                                  setState(() {
                                    snapshot.data!
                                        .remove(snapshot.data![index]);
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].mName)
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].mNote)
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].mTel),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].eDate),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return MemberDetailPage(
                                          mSeq: snapshot.data![index].mSeq!,
                                          mName: snapshot.data![index].mName,
                                          mTel: snapshot.data![index].mTel,
                                          eDate: snapshot.data![index].eDate,
                                          gSeq: snapshot.data![index].gSeq!,
                                          uSeq: snapshot.data![index].uSeq!);
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          _saveSharedPreferences();
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AttendCheckPage();
            },
          ));
        },
      ),
    );
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uSeq1 = (prefs.getInt('p_uSeq'))!;
      print('memberuseq');
      print(uSeq1);
    });
  }

  //login 후 회원 이메일 및 SeqNumber 저장
  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('p_uSeq', uSeq1);
    pref.setInt('p_gSeq', widget.gSeq);
    
    print('widgetgseq');
    print(widget.gSeq);
  } //_saveSharedPreferences

  void reloadData() {
    setState(() {
      handler.queryMembers(uSeq1, widget.gSeq);

      print('ttssbb');
      print(handler.queryMembers(uSeq1, widget.gSeq));
    });
  }
}//end