import 'package:attendi_app/database/database_members.dart';
import 'package:attendi_app/model/members.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InsertMemberPage extends StatefulWidget {
  const InsertMemberPage({super.key});

  @override
  State<InsertMemberPage> createState() => _InsertMemberPageState();
}

class _InsertMemberPageState extends State<InsertMemberPage> {
  late DatabaseHandler handler;
  final DateRangePickerController datePickController =
      DateRangePickerController();
  DateTime? createDate;

  late TextEditingController memberNameController;
  late TextEditingController memberTelController;
  late TextEditingController memberNoteController;
  late TextEditingController dateController;

  late String mName;
  late String mTel;
  late String mNote;
  late String eDate;
  late int uSeq1;
  late int gSeq1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    memberNameController = TextEditingController();
    memberTelController = TextEditingController();
    memberNoteController = TextEditingController();
    dateController = TextEditingController();
    _initSharedPreferences();
    uSeq1 = 0;
    gSeq1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('멤버 추가하기'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('멤버 추가하기'),
            TextField(
              controller: memberNameController,
              decoration: const InputDecoration(hintText: '제니퍼'),
            ),
            TextField(
              controller: memberTelController,
              decoration: const InputDecoration(hintText: '010-1234-1234'),
            ),
            TextField(
              controller: memberNoteController,
              decoration: const InputDecoration(hintText: '클래스 멤버의 특이사항을 적으세요'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                hintText: '참가 시작 날짜 ',
              ),
              readOnly: true,
              onTap: () async {
                _selectDate(context);
              },
              
            ),
            ElevatedButton(
                onPressed: () async {
                  datePickController.selectedDate = createDate;
                  mName = memberNameController.text.toString();
                  mTel = memberTelController.text.toString();
                  mNote = memberNoteController.text.toString();
                  eDate = dateController.text;
                  
                   Members members = Members(
                    mName: mName, 
                    mTel: mTel, 
                    mNote: mNote,
                    eDate: eDate,
                    uSeq: uSeq1,
                    gSeq: gSeq1
                    );
                    print('makingmemberlist');
                  print(eDate);
                  print(uSeq1);

                  await handler.insertMembers(members);

                  _showDialog(context);
                },
                child: const Text('Create'))
          ],
        ),
      ),
    );
  }

_selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        dateController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }

_showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 결과"),
            content: const Text("그룹 생성하시겠습니까?"),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context); // Main화면으로 이동
                },
                child: const Text('네'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('아니요'),
              )
            ],
          );
        });
  }
  
 _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getInt('p_gSeq') != null){

      gSeq1 = (prefs.getInt('p_gSeq'))!;
      }
      uSeq1 = (prefs.getInt('p_uSeq'))!;
      print('memberggseq');
      print(prefs.getInt('p_gSeq'));
      print(uSeq1);
    });
  }
  
}//end