main(){
  //List Collection
  List threeKingdoms = [];

  threeKingdoms.add("위");
  threeKingdoms[0] = "We";  //수정
  // threeKingdoms.removeAt(0);  //삭제
  threeKingdoms.remove("We"); //삭제
  threeKingdoms.add(1);
  threeKingdoms.length;
  print(threeKingdoms);

//Generic: <?>
  List<String> threekingdom2 = ['위','촉','오'];

  // Map : {Key:Value} flutter의 기본구성
  Map fruits = {
    'apple':'사과',
    'grape' : '포도',
    'watermelon' : '수박'
  };
  print(fruits['apple']);

  //수정
  fruits['watermelon'] = '시원한 수박';
  fruits['banana'] = '바나나';

  Map<String, int> fruitsPrice = {
    'apple': 1000,
  };

  print(fruitsPrice['apple']);
  int applePrice = fruitsPrice['apple']!;


  //optional (?, !): null safety확인 >> optional value 해제(!)


}