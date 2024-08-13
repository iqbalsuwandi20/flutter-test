import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String userTable = 'user';
  String colId = 'id';
  String colEmail = 'email';
  String colPassword = 'password';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'user.db');
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colEmail TEXT, '
        '$colPassword TEXT)');
  }

  Future<int> insertUser(User user) async {
    Database? db = await database;
    var result = await db!.insert(userTable, user.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database? db = await database;
    var result = await db!.query(userTable);
    return result;
  }

  Future<int> getCount() async {
    Database? db = await database;
    List<Map<String, dynamic>> result =
        await db!.rawQuery('SELECT COUNT(*) as count FROM $userTable');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
