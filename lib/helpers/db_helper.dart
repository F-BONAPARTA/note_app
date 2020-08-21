import 'package:http_test/providers/notes_list.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_notes(id TEXT PRIMARY KEY,title TEXT,content TEXT,datetime TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<int> deleteItemFromDatabase(String table, String id) async {
    final db = await DBHelper.database();
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateItemInDataBase(Note note, String table) async {
    final db = await DBHelper.database();
    return await db.update(
        table,
        {
          'id': note.id,
          'title': note.title,
          'content': note.content,
          'datetime': note.dateTime.toString()
        },
        where: 'id = ?',
        whereArgs: [note.id]);
  }
}
