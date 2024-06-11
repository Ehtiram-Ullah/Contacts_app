import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'contacts.db');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  final String tableName = "contacts";

  Future<void> create(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName (
        id TEXT PRIMARY KEY,
        name TEXT, 
        phone TEXT
        )''');
  }

  Future<void> insert(String id, String name, String phoneNumber) async {
    await _database!.insert(
        tableName,
        {
          'id': id,
          'name': name,
          'phone': phoneNumber,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> remove(String id) async {
    await _database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    return await db.query(tableName);
  }
}
