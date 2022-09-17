import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/task_model.dart';
import '../../domain/usecases/completed_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/insert_task_usecase.dart';
import '../../domain/usecases/query_usecase.dart';

class TaskController extends GetxController {
  final CompleteTaskUseCase completeTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final InsertTaskUseCase insertTaskUseCase;
  final GetQueryUseCase getQueryUseCase;

  TaskController(this.completeTaskUseCase, this.deleteTaskUseCase,
      this.insertTaskUseCase, this.getQueryUseCase);
  List<TaskModel> tasks = [
    TaskModel(
        id: 0,
        color: 0,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 0,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
    TaskModel(
        id: 0,
        color: 1,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 0,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
    TaskModel(
        id: 0,
        color: 2,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 1,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
    TaskModel(
        id: 0,
        color: 1,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 0,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
    TaskModel(
        id: 0,
        color: 1,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 1,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
    TaskModel(
        id: 0,
        color: 2,
        endTime: "2:18",
        startTime: DateFormat('hh:mm a')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        isCompleted: 0,
        note:
            "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
        title: "Mina "),
  ];

  getTasks() {}

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
    int result = await insertTaskUseCase(TaskModel(
      title: title,
      note: note,
      date: date,
      startTime: startTime,
      endTime: endTime,
      repeat: repeat,
      remind: remind,
      isCompleted: isCompleted,
      color: color,
    ));

    return result;
  }
}
