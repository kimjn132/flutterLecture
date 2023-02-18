import 'package:listview_app/model/animal_List.dart';

class Message {
//animal names
  static String name = '';
//animal images
  static String imagesAnimal = '';

  static bool flyAble = false;

  static String species = '';

  static bool checkNew = false;

  static List<AnimalList> todoList = [];

  static List<String> name1 = ['벌', '고양이', '젖소', '개', '여우', '원숭이', '돼지', '늑대'];
  static List<String> image1 = [
    'images/bee.png',
    'images/cat.png',
    'images/cow.png',
    'images/dog.png',
    'images/fox.png',
    'images/monkey.png',
    'images/pig.png',
    'images/wolf.png'
  ];
  static List<bool> flyAble1 = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
}
