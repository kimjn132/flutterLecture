main(){
  //sync: 
  //Async

  checkVersion();
  print('end process');

}

//Future 빼도 되지만, 있는게 가독성에 편하다.(class와 비교하기 위해서)
Future checkVersion() async{
  //await: 나 말고 다른 프로세스가 끝낼 때까지 , 다 가져오면 내가 일을 시작! 그래서 main에서 print 처리 하고 12가 나온다. even if checkVersion()이 먼저 쓰여 있어도,
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion(){
  return 12;
}