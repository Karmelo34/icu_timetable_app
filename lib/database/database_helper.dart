import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'icu_timetable.db';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE timetable_slots (
            id TEXT PRIMARY KEY,
            course_code TEXT,
            lecturer_name TEXT,
            room TEXT,
            day_of_week TEXT,
            start_time TEXT,
            end_time TEXT
          )
        ''');
      },
    );
  }
}
