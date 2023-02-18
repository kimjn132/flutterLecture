import 'package:attendance_app/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler{
  
  Future<Database> initializeDB() async{
    String path = await getDatabasesPath(); //현재 앱의 위치
    return openDatabase(
      join(path, 'user.db'),
      onCreate: (database, version) async {
        await database.execute(
          'create table user(uSeq integer primary key autoincrement, email text, password text, tel text, joinDate text, mDate text, outDate text)');
      },
      version: 1
        );

  }
Future<int> insertUser(Users user) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into user(email, password, tel, joinDate) values(?,?,?,?)',
      [user.email, user.password, user.tel, user.joinDate]
    );
    return result;
  }

  Future<List<Users>> queryUser() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = 
    await db.rawQuery('select * from user');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }

}