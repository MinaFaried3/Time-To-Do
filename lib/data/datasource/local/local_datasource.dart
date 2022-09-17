import 'package:sqflite/sqlite_api.dart';
import 'package:todo_clean_architecture/data/datasource/local/sql.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';

import '../../../core/utils/global/shared/shared.dart';

abstract class BaseLocalDataSource {
  Future<int> insertTask(TaskModel task);
  Future<int> deleteTask(TaskModel task);
  Future<List<Map<String, dynamic>>> getQueries();
  Future<int> completeTask(int id);
}

class LocalDataSource extends BaseLocalDataSource {
  Database database = DatabaseService.database!;
  String table = DatabaseService.tableName;
  @override
  Future<int> insertTask(TaskModel task) async {
    printK("insert; to database");
    return await database.insert(table, task.toJson());
  }

  @override
  Future<int> deleteTask(TaskModel task) async {
    printK("delete; from database");
    return await database.delete(table, where: "id = ?", whereArgs: [task.id]);
  }

  @override
  Future<List<Map<String, dynamic>>> getQueries() async {
    printK("get queries");
    return await database.query(table);
  }

  @override
  Future<int> completeTask(int id) async {
    return await database.rawUpdate('''
       UPDATE $table
       SET isCompleted = ?
       WHERE id = ?
    ''', [1, id]);
  }
}
