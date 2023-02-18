import 'package:attendi_app/database/database_groups.dart';
import 'package:attendi_app/model/groups.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';


class GroupInsertPage extends StatefulWidget {
  const GroupInsertPage({super.key});

  @override
  State<GroupInsertPage> createState() => _GroupInsertPageState();
}

class _GroupInsertPageState extends State<GroupInsertPage> {
  late DatabaseHandler handler;
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupCategoryController = TextEditingController();
  TextEditingController groupNoteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final DateRangePickerController datePickController =
      DateRangePickerController();
  DateTime? createDate;
  //DateTime _selectedDate;

  late String gName;
  late String gCategory;
  late String gNote;
  late String cDate;
  late int uSeq1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    groupNameController = TextEditingController();
    groupCategoryController = TextEditingController();
    groupNoteController = TextEditingController();
    dateController = TextEditingController();
    uSeq1 = 0;
    handler = DatabaseHandler();
    _initSharedPreferences();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('그룹추가'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('그룹 추가하기'),
            TextField(
              controller: groupNameController,
              decoration: const InputDecoration(hintText: '예) 요가 클래스'),
            ),
            TextField(
              controller: groupCategoryController,
              decoration: const InputDecoration(hintText: '예) 운동, 미술, 음악'),
            ),
            TextField(
              controller: groupNoteController,
              decoration: const InputDecoration(hintText: '예) 요가 초급반-오전반'),
            ),
            TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                hintText: '-',
              ),
              onTap: () async {
                _selectDate(context);
              },
              
            ),
            ElevatedButton(
                onPressed: () async {
                  datePickController.selectedDate = createDate;
                  gName = groupNameController.text.toString();
                  gCategory = groupCategoryController.text.toString();
                  gNote = groupNoteController.text.toString();
                  cDate = dateController.text;
                  
                  Groups groups = Groups(
                      gName: gName,
                      gCategory: gCategory,
                      gNote: gNote,
                      cDate: cDate,
                      uSeq: uSeq1
                      );
                  print(cDate);
                  print(uSeq1);

                  await handler.insertGroups(groups);

                  _showDialog(context);
                },
                child: const Text('Create'))
          ],
        ),
      ),
    );
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

_initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uSeq1 = (prefs.getInt('p_uSeq'))!;

      print(uSeq1);
    });
  }

}//end