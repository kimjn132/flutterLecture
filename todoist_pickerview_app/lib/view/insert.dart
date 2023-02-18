import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoist_pickerview_app/model/message.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late int selectedItem;
  late TextEditingController inputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = 0;
    inputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add View"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

            Image.asset(
            '${Message.imagePath[selectedItem]}',
            width: 50,
            height: 50,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                  children: [
                    Image.asset(Message.imagePath[0]),
                    Image.asset(Message.imagePath[1]),
                    Image.asset(Message.imagePath[2]),
                  ]),
            ),
              ],
            ),

            TextField(
              controller: inputController,
              
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              insertService();
            }, 
            child: Text('추가'))
            
          ],
        ),
      ),
    );
  }
//function---------------
insertService(){
  Message.imagePath1 = Message.imagePath[selectedItem];
  Message.workList1 = inputController.text.trim();

  Message.imagePath.add(Message.imagePath1);
  Message.workList.add(Message.workList1);

  print(Message.workList1);
}

}//end
