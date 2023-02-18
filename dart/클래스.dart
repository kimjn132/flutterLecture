main(){
    //class 사용
      ThreeKingdoms threeKingdoms = ThreeKingdoms('유비', '촉');
      threeKingdoms.saySomething();

}



class ThreeKingdoms{
  // Field or Property: 자바에는 없지만 꼭 초기값이 있어야 한다.
  String? name;
  late String nation; //instance 만들어서 data를 넣겠다.는 의미와 흡사하다.

  // Constructor
  ThreeKingdoms(String name, String nation)
  //this.name: field에 있는 name, = 뒤에 있는 name은 constructor에 있는 String name
  : this.name = name,
    this.nation = nation;


  // Function(Method)
  saySomething(){
    print('제 이름은 ${this.name} 이고 조국은 ${this.nation} 입니다.');
  }

}