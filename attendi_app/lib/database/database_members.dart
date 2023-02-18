import 'package:attendi_app/model/members.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {

  // member 데이터 관리
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'members.db'),
      onCreate: (database, version) async {
        
        await database.execute(
            "create table members(mSeq integer primary key autoincrement, mName text, mTel text, mNote text, eDate text, oDate text, uSeq integer, gSeq integer, foreign key (uSeq) references users(uSeq), foreign key (gSeq) references groups(gSeq))");
      },
      version: 1,
      
    );
  }

//group 안의 멤버 추가하기 
  Future<int> insertMembers(Members members) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into members(mName, mTel, mNote, eDate, uSeq, gSeq) values (?,?,?,?,?,?)',
        [members.mName, members.mTel, members.mNote, members.eDate, members.uSeq, members.gSeq]);
    return result;
  }

Future<List<Members>> queryMembers(int uSeq, int gSeq) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery("select * from members where uSeq = '$uSeq' and  gSeq = '$gSeq'");
        print(">>memberlist");
    print(queryResult.map((e) => Members.fromMap(e)).toList());
    return queryResult.map((e) => Members.fromMap(e)).toList();
  }

  //해당 그룹의 해당 멤버 정보 수정
  Future<int> updateMembers(Members members) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update members set mName = ?, mTel = ?, mNote = ? where uSeq = ? and gSeq = ?',
        [members.mName, members.mTel, members.mNote, members.uSeq, members.gSeq]);
    return 0;
  }

  // //해당 그룹의 해당 멤버 삭제(outDate = oDate)
  // Future<int> deleteMembers(Members members) async {
  //   final Database db = await initializeDB();
  //   await db.rawUpdate(
  //       'update members set oDate = ? where uSeq = ? and gSeq = ?',
  //       [members.oDate, members.uSeq, members.gSeq]);
  //   return 0;
  // }
  Future<void> deleteMembers(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete('delete from members where mSeq = ?',[id]);
  }

}