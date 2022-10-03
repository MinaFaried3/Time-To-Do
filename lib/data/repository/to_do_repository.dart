import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/error/exceptions.dart';
import 'package:todo_clean_architecture/data/datasource/local/local_datasource.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../core/error/failure.dart';
import '../model/task_model.dart';

class ToDoRepository extends BaseToDoRepository {
  BaseLocalDataSource baseLocalDataSource;
  ToDoRepository(this.baseLocalDataSource);

  @override
  Future<Either<Failure, int>> insertTask(TaskModel task) async {
    final result = await baseLocalDataSource.insertTask(task);
    try {
      return Right(result);
    } on LocalDataBaseException catch (failure) {
      return Left(LocalFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> deleteTask(TaskModel task) async {
    final result = await baseLocalDataSource.deleteTask(task);

    try {
      return Right(result);
    } on LocalDataBaseException catch (failure) {
      return Left(LocalFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> deleteAll() async {
    final result = await baseLocalDataSource.deleteAll();

    try {
      return Right(result);
    } on LocalDataBaseException catch (failure) {
      return Left(LocalFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getQueries() async {
    final result = await baseLocalDataSource.getQueries();
    try {
      return Right(result);
    } on LocalDataBaseException catch (failure) {
      return Left(LocalFailure(failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> completeTask(int id) async {
    final result = await baseLocalDataSource.completeTask(id);

    try {
      return Right(result);
    } on LocalDataBaseException catch (failure) {
      return Left(LocalFailure(failure.errorMessage));
    }
  }
}
