main(){
//상수: 변하지 않는 데이터
  final String name1 = '유비';
  const String name2 = '관우';

  //final DateTime now1 = new DateTime.now();
  final now1 = DateTime.now(); //변수타입(유추 가능), new(생성자) 없어도 된다.
  print(now1);
  //final은 실행시에 결정 

  // 실행시 결정되는 값으로 정할 수 없다. 정해진 값만 수용.
  //const DateTime now2 = new DateTime.now();
// const now2 = DateTime.now();  //>> error(now()는 실행시 결정되는 값이다.)


}