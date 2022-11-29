import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  //create database
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE todos(id TEXT PRIMARY KEY ,title TEXT,isDone BOOLEAN)');
      },
      version: 1,
    );
  }

  //insert data
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  //get data
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  //delete data
  static Future<void> deleteData(String table,String id) async{
    final db = await DBHelper.database();
    await db.delete(table,where: 'id=?',whereArgs: [id]);
  }
}
