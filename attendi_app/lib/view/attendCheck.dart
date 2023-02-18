import 'package:attendi_app/database/database_members.dart' as members;
import 'package:attendi_app/database/database_check.dart' as checkk;
import 'package:attendi_app/model/check.dart';
import 'package:attendi_app/model/members.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AttendCheckPage extends StatefulWidget {
  const AttendCheckPage({super.key});

  @override
  State<AttendCheckPage> createState() => _AttendCheckPageState();
}

class _AttendCheckPageState extends State<AttendCheckPage> {
  
  final DateRangePickerController datePickController =
      DateRangePickerController();
  DateTime? createDate;

  late members.DatabaseHandler handler;
  late checkk.DatabaseHandler handler1;

  late int? uSeq1;
  late int? gSeq1;
  late int mSeq1;
  late int click;
  late List<int> mSeqArray;
  late List<int> click1;
  late List<Members> list;
  late List<TextEditingController> mNoteArray;

  TextEditingController attendController = TextEditingController();
  late TextEditingController dateController;
  late TextEditingController mNoteController;
  late TextEditingController showNoteController;

  late String checkDate;
  late int check;
  late String cNote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = members.DatabaseHandler();
    handler1 = checkk.DatabaseHandler();
    dateController = TextEditingController();
    mSeqArray = [];
    list = [];
    mNoteArray = [];
    click1 = [];
    handler.initializeDB().whenComplete(() async {
      list = await handler.queryMembers(uSeq1!, gSeq1!);
      print(list.length);
      
      click1 = List.filled(list.length, 0);
      
      //mNoteArray = List.filled(list.length, mNoteController);
      //print(mNoteArray);
    //   setState(() {});
     });
    
    uSeq1 = 0;
    gSeq1 = 0;
    mSeq1=0;
    click = 0;
 
   
    print("click1Array");
    print(click1);
    attendController = TextEditingController();
    mNoteController = TextEditingController();
    showNoteController = TextEditingController();
    _initSharedPreferences();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('출석체크'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                hintText: 'Date'
              ),
              readOnly: true,
              onTap: () async {
                _selectDate(context);
              },
            ),
            
            ListView.builder(
                //해당 아래 두 라인(scrollDirection, shrinkWrap) 사용하면 "Vertical viewport was given unbounded height" 해당 에러가 해결된다. 
                //하지만 스크롤이 안됨
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                //physics를 넣으면 스크롤 가능!!
                physics: const ScrollPhysics(),
                
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  mNoteArray.add(TextEditingController());
                  mSeqArray.add(list[index].mSeq!);
                  return Card(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(list[index].mSeq.toString()),
                              Text(list[index].mName),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 35,
                          child: TextField(
                            controller: mNoteArray[index],
                            onTap: () async {
                              setState(() {
                              _cNoteDialog(context, index);
                                
                              });
                            },
                            readOnly: true,
                          ),
                        ),

                        IconButton(
                          
                          onPressed: () {
                            setState(() {
                              
                              if (click1[index] < 2) {
                                click1[index]++;
                              } else {
                                click1[index] = 0;
                              }
                              print('click11');
                              print(click1[index]);
                              print(index);
                            });
                          },
                          icon: click1[index] == 0
                              ? const Icon(Icons.block)
                              : click1[index] == 1
                                  ? const Icon(Icons.airline_seat_individual_suite)
                                  : const Icon(Icons.check),
                        ),
                        
                          ],
                        ),
                        
                      ],
                    ),
                  
                  );
                  
                }
                
                ),
                ElevatedButton(
                  onPressed: () async {
                    datePickController.selectedDate = createDate;
                  checkDate = dateController.text.toString();
                  // check = click1[list.length-1];
                  // cNote = mNoteArray[list.length-1].text;
                  
                  
                   Check checking = Check(checkDate: checkDate, attend: click1[list.length-1], cNote: mNoteArray[list.length-1].text, uSeq: uSeq1, gSeq: gSeq1, mSeq: mSeqArray[list.length-1]);
                    
                  print(click1[list.length-1]);
                  await handler1.insertCheck(checking);

                  
                  }, 
                  child: const Text('add'))
          ],
        ),
      ),
    );
  }
//function--------

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uSeq1 = (prefs.getInt('p_uSeq'))!;
      gSeq1 = (prefs.getInt('p_gSeq'))!;
      print('attenduseq');
      print(uSeq1);
      print(gSeq1);
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

  _cNoteDialog(BuildContext context, int index) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 결과"),
            content: TextField(
              controller: mNoteArray[index],
              decoration: const InputDecoration(
                hintText: '출석 특이사항'
              ),
              keyboardType: TextInputType.text,
            ),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();

                },
                child: const Text('입력'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('취소'),
              )
            ],
          );
        });
       
      
    
  }

  
}//end
