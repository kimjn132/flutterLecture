class Message {
  static String workList = '';
  //화면에서'책구매' 클릭하면 해당 값을 버튼에 넣어줌
  static String imagePath = '';

  //체크를 안 할시, 새로 입력하지 않고 빈칸인 상태로 버튼을 눌러도 이전 것이 계속 추가된다.
  //새로운 것만 입력되도록 체크해줘야함>>false
  static bool checkNew = false;
}
