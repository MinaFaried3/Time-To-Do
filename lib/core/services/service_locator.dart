import 'package:get_it/get_it.dart';
import 'package:todo_clean_architecture/data/datasource/local/local_datasource.dart';
import 'package:todo_clean_architecture/data/repository/to_do_repository.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';
import 'package:todo_clean_architecture/domain/usecases/delete_all.dart';

import '../../domain/usecases/completed_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/insert_task_usecase.dart';
import '../../domain/usecases/query_usecase.dart';
import '../../presentation/controller/task_controller.dart';
import '../utils/global/notification/notification_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///GetX controllers
    getIt.registerFactory(
        () => TaskController(getIt(), getIt(), getIt(), getIt(), getIt()));

    /// USE CASES
    getIt.registerLazySingleton(() => InsertTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => DeleteTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => CompleteTaskUseCase(getIt()));

    getIt.registerLazySingleton(() => GetQueryUseCase(getIt()));
    getIt.registerLazySingleton(() => DeleteAllUseCase(getIt()));

    /// REPOSITORY
    getIt.registerLazySingleton<BaseToDoRepository>(
        () => ToDoRepository(getIt()));

    ///DATA SOURCE
    getIt.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

    ///Notification
    getIt.registerLazySingleton<NotificationService>(
        () => NotificationService());
  }
}
