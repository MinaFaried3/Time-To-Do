import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/shared.dart';

import '../../data/model/task_model.dart';
import '../../domain/usecases/completed_task_usecase.dart';
import '../../domain/usecases/delete_all.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/insert_task_usecase.dart';
import '../../domain/usecases/query_usecase.dart';

class TaskController extends GetxController {
  final CompleteTaskUseCase _completeTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final InsertTaskUseCase _insertTaskUseCase;
  final GetQueryUseCase _getQueryUseCase;
  final DeleteAllUseCase _deleteAllUseCase;

  TaskController(this._completeTaskUseCase, this._deleteTaskUseCase,
      this._insertTaskUseCase, this._getQueryUseCase, this._deleteAllUseCase);
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  Future<void> getTasks() async {
    final result = await _getQueryUseCase();
    result.fold((l) => printK(l.failureMessage),
        (r) => tasks.assignAll(r.map((e) => TaskModel.fromJson(e)).toList()));
  }

  Future<int> addTaskToDB({
    required String title,
    required String note,
    required String date,
    required String startTime,
    required String endTime,
    required String repeat,
    required int color,
    required int remind,
    int isCompleted = 0,
  }) async {
    TaskModel task = TaskModel(
      title: title,
      note: note,
      date: date,
      startTime: startTime,
      endTime: endTime,
      repeat: repeat,
      remind: remind,
      isCompleted: isCompleted,
      color: color,
    );

    final result = await _insertTaskUseCase(task);

    return result.fold((l) {
      printK(l.failureMessage);
      return -1;
    }, (r) async {
      await getTasks();
      return r;
    });
  }

  Future<int> deleteTask(TaskModel task) async {
    final result = await _deleteTaskUseCase(task);
    return result.fold((l) {
      printK(l.failureMessage);
      return -1;
    }, (r) async {
      await getTasks();
      return r;
    });
  }

  Future<int> completeTask(int id) async {
    final result = await _completeTaskUseCase(id);
    return result.fold((l) {
      printK(l.failureMessage);
      return -1;
    }, (r) async {
      await getTasks();
      return r;
    });
  }

  Future<int> deleteAll() async {
    final result = await _deleteAllUseCase();
    return result.fold((l) {
      printK(l.failureMessage);
      return -1;
    }, (r) async {
      await getTasks();
      return r;
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> changeSelectedDate(DateTime newDate) async {
    selectedDate = newDate;
    await getTasks();
  }
}
