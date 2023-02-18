import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KAKAO Book'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
      },
      child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async{

    var url = Uri.parse(
      'https://dapi.kakao.com/v3/search/book?target=title&query=알고리즘'
    );
    var response = await http.get(url,
    headers: {"Authorization" : "KakaoAK d7161f3773328769f74b77cbafadb256"});

    print(response.body);

    return "success";
  }




}//END