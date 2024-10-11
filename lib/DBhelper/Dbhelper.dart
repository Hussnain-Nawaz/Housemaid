import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "device_db.db";
  static const _databaseVersion = 1;

  static const table = 'device_table';
  static const columnId = '_id';
  static const columnDeviceId = 'device_id';

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnDeviceId TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertDeviceId(String deviceId) async {
    Database db = await instance.database;
    return await db.insert(table, {columnDeviceId: deviceId});
  }

  Future<String?> getDeviceId() async {
    Database db = await instance.database;
    List<Map> result = await db.query(table);
    if (result.isNotEmpty) {
      return result.first[columnDeviceId] as String;
    }
    return null;
  }
}
