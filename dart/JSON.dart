import 'dart:convert';

main(){
  //json
  var jsonString = """
  [
    { 
      "score" : 40
    },
    {
      "score" : 80
    }
  ]
""";
//list 타입으로 바꿔야 된다.>>dynamic(int, string 둘다 가능, 마음대로 가능)
//jsonDecode가 json을 list로 바꿔준다. >> json안에 string, int값 둘다 들어가 있으므로 jsondecode를 통해서 list로 바꿈
  var scores = jsonDecode(jsonString);
  print(scores is List);  //>>true
  print(scores);
  print(scores[0]['score']);

}
//2021.3월 이후 버전 구글링!!

