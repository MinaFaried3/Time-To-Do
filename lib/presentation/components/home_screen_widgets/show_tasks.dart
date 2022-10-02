import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/presentation/components/home_screen_widgets/no_task.dart';
import 'package:todo_clean_architecture/presentation/components/task_tile.dart';

import '../../../core/utils/global/notification/notification_service.dart';
import '../../../data/model/task_model.dart';
import '../../controller/task_controller.dart';
import 'bottom_sheet.dart';

class ShowTasks extends StatefulWidget {
  const ShowTasks({Key? key}) : super(key: key);

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  TaskController taskController = Get.put(getIt<TaskController>());

  late NotificationService notificationService;
  @override
  void initState() {
    super.initState();
    notificationService = getIt<NotificationService>();
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Obx(() {
      if (taskController.tasks.isEmpty) {
        return const NoTasks();
      } else {
        return Align(
          alignment: AlignmentDirectional.topCenter,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              TaskModel task = taskController.tasks[index];
              DateTime startTime = DateFormat.jm().parse(task.startTime!);
              DateTime date = DateFormat.yMd().parse(task.date!);
              DateTime selectedDate = taskController.selectedDate;
              int hour = int.parse(DateFormat("HH:mm")
                  .format(startTime)
                  .toString()
                  .split(':')[0]);
              int minute = int.parse(DateFormat("HH:mm")
                  .format(startTime)
                  .toString()
                  .split(':')[1]);
              bool isSelectedDate =
                  (task.date == DateFormat.yMd().format(selectedDate));
              bool isDaily = (task.repeat == 'Daily');
              bool isWeekly = (task.repeat == 'Weekly' &&
                  selectedDate.difference(date).inDays % 7 == 0);
              bool isMonthly =
                  (task.repeat == 'Monthly' && date.day == selectedDate.day);

              notificationService.scheduledNotification(hour, minute, task);

              if (isSelectedDate || isDaily || isWeekly || isMonthly) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 900),
                  child: SlideAnimation(
                    horizontalOffset: 300,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () async {
                          await showTaskBottomSheet(context, task);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: sizeConfig.screenWidth * 0.016,
                              bottom: sizeConfig.screenWidth * 0.009,
                              left: sizeConfig.screenWidth * 0.009),
                          child: TaskTile(task),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
            itemCount: taskController.tasks.length,
          ),
        );
      }
    });
  }
}
