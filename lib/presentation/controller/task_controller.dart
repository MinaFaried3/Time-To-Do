import 'package:get/get.dart';

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
    List<Map<String, dynamic>> result = await _getQueryUseCase();

    tasks.assignAll(result.map((e) => TaskModel.fromJson(e)).toList());
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

    int result = await _insertTaskUseCase(task);

    await getTasks();
    return result;
  }

  Future<int> deleteTask(TaskModel task) async {
    final int result = await _deleteTaskUseCase(task);
    await getTasks();
    return result;
  }

  Future<int> completeTask(int id) async {
    final int result = await _completeTaskUseCase(id);
    await getTasks();
    return result;
  }

  Future<int> deleteAll() async {
    final int result = await _deleteAllUseCase();
    await getTasks();
    return result;
  }

  DateTime selectedDate = DateTime.now();
  Future<void> changeSelectedDate(DateTime newDate) async {
    selectedDate = newDate;
    await getTasks();
  }
}
