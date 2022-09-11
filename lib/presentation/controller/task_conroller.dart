import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/task_model.dart';

class TaskController extends GetxController {
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
  ];
  getTasks() {}
}
