import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/model/task_model.dart';

abstract class BaseToDoRepository {
  Future<Either<Failure, int>> insertTask(TaskModel task);

  Future<Either<Failure, int>> deleteTask(TaskModel task);

  Future<Either<Failure, int>> deleteAll();

  Future<Either<Failure, List<Map<String, dynamic>>>> getQueries();

  Future<Either<Failure, int>> completeTask(int id);
}
