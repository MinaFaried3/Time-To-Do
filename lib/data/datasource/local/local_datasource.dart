import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_clean_architecture/core/error/exceptions.dart';
import 'package:todo_clean_architecture/data/datasource/local/sql.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';

import '../../../core/utils/global/shared/shared.dart';

abstract class BaseLocalDataSource {
  Future<int> insertTask(TaskModel task);
  Future<int> deleteTask(TaskModel task);
  Future<int> deleteAll();
  Future<List<Map<String, dynamic>>> getQueries();
  Future<int> completeTask(int id);
}

class LocalDataSource extends BaseLocalDataSource {
  Database? database = DatabaseService.database;
  String table = DatabaseService.tableName;
  @override
  Future<int> insertTask(TaskModel task) async {
    printK("insert; to database");
    try {
      return await database!.insert(table, task.toJson());
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<int> deleteTask(TaskModel task) async {
    printK("delete; from database");
    try {
      return await database!
          .delete(table, where: "id = ?", whereArgs: [task.id]);
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<int> deleteAll() async {
    printK("deleted All; from database");
    try {
      return await database!.delete(table);
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getQueries() async {
    printK("get queries");
    try {
      return await database!.query(table);
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<int> completeTask(int id) async {
    printK("task completed");
    try {
      return await database!.rawUpdate('''
       UPDATE $table
       SET isCompleted = ?
       WHERE id = ?
    ''', [1, id]);
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }
}
