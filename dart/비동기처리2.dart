

main(){
  getVersionname().then((value) => print(value));
  //then: 페이지 새로 안만들고 그 위에 겹쳐서 만들기
  //value: ? 
  print('end Process');
}

Future<String> getVersionname() async{
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName(){
  return "Android Q";
}
