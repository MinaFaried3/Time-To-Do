import '../../data/model/task_model.dart';

abstract class BaseToDoRepository {
  Future<int> insertTask(TaskModel task);

  Future<int> deleteTask(TaskModel task);

  Future<List<Map<String, dynamic>>> getQueries();

  Future<int> completeTask(int id);
}
