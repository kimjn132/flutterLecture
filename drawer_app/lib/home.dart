import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () {
              print('Shopping cart is clicked');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search is clicked');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //drawer header까지 꽉 찬다.
          children:  [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/ppikka1.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/ppikka2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/ppikka3.png'),
                )
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 124, 238),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
            ),
            ListTile(
              leading:  const Icon(
                Icons.home,
                color:  Colors.black,
              ),
              title:  const Text('Home'),
              onTap: () {
                print('Home is clicked.');
              },
              trailing: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
