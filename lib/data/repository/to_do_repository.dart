import 'package:todo_clean_architecture/data/datasource/local/local_datasource.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../model/task_model.dart';

class ToDoRepository extends BaseToDoRepository {
  BaseLocalDataSource baseLocalDataSource;
  ToDoRepository(this.baseLocalDataSource);

  @override
  Future<int> insertTask(TaskModel task) async {
    return await baseLocalDataSource.insertTask(task);
  }

  @override
  Future<int> deleteTask(TaskModel task) async {
    return await baseLocalDataSource.deleteTask(task);
  }

  @override
  Future<List<Map<String, dynamic>>> getQueries() async {
    return await baseLocalDataSource.getQueries();
  }

  @override
  Future<int> completeTask(int id) async {
    return await baseLocalDataSource.completeTask(id);
  }
}
