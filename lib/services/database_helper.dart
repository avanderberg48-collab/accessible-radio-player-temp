import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/radio_station.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('radio_stations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE stations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        url TEXT NOT NULL,
        isFavorite INTEGER NOT NULL DEFAULT 0,
        addedDate TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertStation(RadioStation station) async {
    final db = await database;
    return await db.insert('stations', station.toMap());
  }

  Future<List<RadioStation>> getAllStations() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'stations',
      orderBy: 'addedDate DESC',
    );
    return List.generate(maps.length, (i) => RadioStation.fromMap(maps[i]));
  }

  Future<int> updateStation(RadioStation station) async {
    final db = await database;
    return await db.update(
      'stations',
      station.toMap(),
      where: 'id = ?',
      whereArgs: [station.id],
    );
  }

  Future<int> deleteStation(int id) async {
    final db = await database;
    return await db.delete(
      'stations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
