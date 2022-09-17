import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';
import 'package:todo_clean_architecture/presentation/components/task_tile.dart';

import '../../../core/utils/global/notification/notification_service.dart';
import '../../controller/task_controller.dart';
import 'bottom_sheet.dart';

class ShowTasks extends StatefulWidget {
  const ShowTasks({Key? key}) : super(key: key);

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  final TaskController taskController = Get.put(getIt<TaskController>());

  late NotificationService notificationService;
  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
    notificationService.requestIOSPermissions();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    late DateTime date;
    late int minute;
    late int hour;
    late TaskModel task;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        task = taskController.tasks[index];
        date = DateFormat.jm().parse(task.startTime!);
        hour = int.parse(
            DateFormat("HH:mm").format(date).toString().split(':')[0]);
        minute = int.parse(
            DateFormat("HH:mm").format(date).toString().split(':')[1]);
        // printK(" hour is $hour minute is $minute");

        notificationService.scheduledNotification(hour, minute, task);
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 1200),
          child: SlideAnimation(
            horizontalOffset: 300,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () async {
                  await showTaskBottomSheet(context, task);
                },
                child: TaskTile(task),
              ),
            ),
          ),
        );
      },
      itemCount: taskController.tasks.length,
    );
  }
}
