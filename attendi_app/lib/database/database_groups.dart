import 'package:attendi_app/model/groups.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {

  // Group 데이터 관리
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'groups.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table groups(gSeq integer primary key autoincrement, gName text, gCategory text, gNote text, cDate text, dDate text, uSeq integer, foreign key (uSeq) references users(uSeq))");
      },
      version: 1,
    );
  }

//login 후에 uSeq static에 넣은 상태에서 활용, group 만들기 
  Future<int> insertGroups(Groups groups) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into groups(gName, gCategory, cDate, uSeq) values (?,?,?,?)',
        [groups.gName, groups.gCategory, groups.cDate, groups.uSeq]);
    return result;
  }

 

//user가 만든 그룹 list 보여주기
Future<List<Groups>> queryGroups(int uSeq) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from groups where uSeq = $uSeq');
    print(">>>>");
    print(queryResult.map((e) => Groups.fromMap(e)).toList());
    return queryResult.map((e) => Groups.fromMap(e)).toList();
  }

//해당 유저의 해당 그룹 정보 수정
  Future<int> updateGroups(Groups groups) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update groups set gName = ?, gCategory = ? where gSeq = ? and uSeq = ?',
        [groups.gName, groups.gCategory, groups.gSeq, groups.uSeq]);
    return 0;
  }

//해당 유저의 해당 그룹 삭제 
  // Future<int> deleteGroups(Groups groups) async {
  //   final Database db = await initializeDB();
  //   await db.rawUpdate(
  //       'update groups set dDate = ? where gSeq = ? and uSeq = ?',
  //       [groups.dDate, groups.gSeq, groups.uSeq]);
  //   return 0;
  // }
  Future<void> deleteGroups(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete('delete from groups where gSeq = ?',[id]);
  }

}