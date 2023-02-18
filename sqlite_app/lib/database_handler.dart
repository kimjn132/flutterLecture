import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/student.dart';

class DatabaseHandler{
  //Dao와 비슷하다.
  Future<Database> initializeDB() async{
    String path = await getDatabasesPath(); //현재 앱의 위치
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (database, version) async {
        await database.execute(
          'create table students(id integer primary key autoincrement, code text, name text, dept text, phone text)');
      },
      version: 1
        );

  }

  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into students(code, name, dept, phone) values(?,?,?,?)',
      [student.code, student.name, student.dept, student.phone]);

    return result;
  }


  Future<List<Students>> queryStudents() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = 
    await db.rawQuery('select * from students');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> updateStudents(Students students) async{
    int result1 = 0;
    final Database db = await initializeDB();
    
    result1 = await db.rawUpdate('update students set name = ?, dept = ?, phone = ? where code = ?', [students.name, students.dept, students.phone, students.code]);
    return result1;
  }
  Future<int> deleteStudents(String code) async{
    int result2 = 0;
    final Database db = await initializeDB();
    
    result2 = await db.rawDelete('delete from students where code = ?', [code]);
    return result2;
  }

  

}