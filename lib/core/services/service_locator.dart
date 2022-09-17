import 'package:get_it/get_it.dart';
import 'package:todo_clean_architecture/data/datasource/local/local_datasource.dart';
import 'package:todo_clean_architecture/data/repository/to_do_repository.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';
import 'package:todo_clean_architecture/domain/usecase/completed_task_usecase.dart';
import 'package:todo_clean_architecture/domain/usecase/delete_task_usecase.dart';
import 'package:todo_clean_architecture/domain/usecase/insert_task_usecase.dart';
import 'package:todo_clean_architecture/domain/usecase/query_usecase.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///GetX controllers

    /// USE CASES
    getIt.registerLazySingleton(() => InsertTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => DeleteTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => CompleteTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => GetQueryUseCase(getIt()));

    /// REPOSITORY
    getIt.registerLazySingleton<BaseToDoRepository>(
        () => ToDoRepository(getIt()));

    ///DATA SOURCE
    getIt.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());
  }
}
