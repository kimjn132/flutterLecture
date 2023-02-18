import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<int> todoList;
  late String _imageName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];
    _imageName = "";
    for (int i = 1; i <= 100; i++) {
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main View"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length, //
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Card(
                  
                  color: index % 2 == 0 ? Colors.red : Colors.amberAccent,

                  
                    child: Center(
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            index % 3 == 0 ? "images/pomheart.png" : 
                            index % 3 == 1 ? "images/pompompurin.png" : "images/pompompurindaddy.jpeg"
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                          Text("-->"),
                          Text(index.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              
            }),
      ),
    );
  }
}
