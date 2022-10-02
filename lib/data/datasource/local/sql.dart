import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/shared.dart';

class DatabaseService extends Equatable {
  static const int version = 1;
  static Database? database;
  static const String tableName = 'tasks';

  static Future<Database?> initDB() async {
    if (database != null) {
      printK("database is already created");
    } else {
      try {
        String path = "${getDatabasesPath()}tasks.db";
        database = await openDatabase(path, version: version,
            onCreate: (Database db, int version) async {
          printK("creating new database");
          await db.execute('CREATE TABLE $tableName('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title STRING, '
              'note TEXT, '
              'date STRING, '
              'startTime STRING, '
              'endTime STRING, '
              'remind INTEGER, '
              'repeat STRING, '
              'color INTEGER, '
              'isCompleted INTEGER)');
        });
        return database!;
      } catch (e) {
        printK(e.toString());
      }
    }
    return null;
  }

  @override
  List<Object?> get props => [version, database, tableName];
}
