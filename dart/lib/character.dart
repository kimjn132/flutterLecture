void main() {
  String str = 'Hello';
  List list = [];
  int currentCharacter = 0;

  list = str.split('');
  print(list);
  print(list[0] + list[1]);
}