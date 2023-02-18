import 'package:flutter/material.dart';


class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "/send");
            }, 
            icon: const Icon(Icons.email),
            ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "/received");
            }, 
            icon: const Icon(Icons.email_outlined),
            ),
          const CircleAvatar(
            backgroundImage: AssetImage('images/starfish.png'),
            radius: 25,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/starfish.png'),
              ),
              accountName: Text('Ddungyi'), 
              accountEmail: Text('ddungyi@naver.com\n안녕하세요. 뚱이에요'),
              
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/send");
                  }, 
                  icon: const Icon(
                    Icons.email,
                    color: Colors.green,
                  ),),
                title: const Text('보낸 편지함'),
                
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/received");
                  }, 
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.red,
                  ),),
                title: const Text('받은 편지함'),
                
              ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //
                Navigator.pushNamed(context, "/send");
              }, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text('보낸 편지함'),
              ),
            ElevatedButton(
              onPressed: () {
                //
                Navigator.pushNamed(context, "/received");
              }, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: const Text('받은 편지함'),
              ),
          ],
        ),
      ),
    );
  }
}