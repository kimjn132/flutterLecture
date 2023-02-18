import 'package:attendi_app/model/check.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {

  // Group 데이터 관리
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'check.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table check(cSeq integer primary key autoincrement, checkDate text, attend integer, cNote text, uSeq integer, mSeq integer, gSeq integer, foreign key (uSeq) references users(uSeq), foreign key (mSeq) references users(mSeq), foreign key (gSeq) references users(gSeq))");
      },
      version: 1,
    );
  }

//출석 관리 ( attend, absence, noshow  >> 0이 기본값이고 셋 중에 체크되면 1로 받음), 해당 유저의 해당 그룹 및 각 멤버 mSeq 까지 insert
  Future<int> insertCheck(Check check) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into check(checkDate, attend, cNote, uSeq, mSeq, gSeq) values (?,?,?,?,?,?)',
        [check.checkDate, check.attend, check.cNote, check.uSeq, check.mSeq, check.gSeq]);
    return result;
  }

// 해당 그룹 안 멤버의 출석 관련 정보 업데이트(수정)
  Future<int> updateCheck(Check check) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update check set checkDate = ?, attend = ?, cNote = ? where uSeq = ? and mSeq = ? and gSeq = ?',
        [check.checkDate, check.attend, check.cNote, check.uSeq, check.mSeq, check.gSeq]);
    return 0;
  }
}