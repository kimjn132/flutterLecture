import 'package:attendi_app/model/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//회원 관리 테이블(create table)
class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table users(uSeq integer primary key autoincrement, email text, password text, tel text, joinDate text, outDate text)");
      },
      version: 1,
    );
  }

//회원 가입(insert joinDate)
  Future<int> insertUsers(Users users) async {
    int result = 0;
    final Database db1 = await initializeDB();
    result = await db1.rawInsert(
        'insert into users(email, password, tel, joinDate) values (?,?,?,current_date)',
        [users.email, users.password, users.tel]);
    return result;
  }

//로그인
Future<bool> loginUsers(Users users) async {
 
    final Database db = await initializeDB();
    var res1 = await db.rawQuery("select * from users where email = '${users.email}' and password = '${users.password}'");
    if(res1.isNotEmpty) {
      return true;// 있다 로그인 오케
    }
    return false; // 없다 로그인 ㄴㄴ
  }

//로그인 후 정보 갖고오기
Future<List<Users>> queryUsers(Users users) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery("select * from users where email = '${users.email}'");
        
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }

Future<List<Users>> queryUsersEmail(String email) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery("select * from users where email = '$email'");
        
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }


//로그인 후 uSeq
Future<List<Users>> uSeqUsers(Users users) async {
   
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
    await db.rawQuery("select uSeq from users where email = '${users.email}'");
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }

//회원 탈퇴(update outDate)
  Future<int> deleteUsers(Users users) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update users set outDate = ? where uSeq = ?',
        [users.password, users.tel, users.outDate, users.uSeq]);
    return 0;
  }

//회원 탈퇴(update info)
  Future<int> updateUsers(Users users) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update users set password = ?, tel = ? where uSeq = ?',
        [users.password, users.tel, users.uSeq]);
    return 0;
  }

}