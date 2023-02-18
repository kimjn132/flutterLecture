//중요: DB 사용 때 쓰인다.
main(){
  int num1 = 100;
  //int num2 = null;  //null 못들어감, 에러남 , 왜냐하면 int 변수명 이 형태는 null을 수용하지 않는 형태다.
  int? num3 = null; //? 이 optional 표시는 null값 허용해준다.

  num3 ??= 0; //num3가 널이면 0으로 주겠다. 는 뜻이다.if 사용 X >> null병합 연산자

  
}