import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';
import 'package:todo_clean_architecture/presentation/controller/task_controller.dart';

import '../../../core/utils/global/notification/notification_service.dart';

class BuildBottomSheetItem extends StatelessWidget {
  const BuildBottomSheetItem(
      {required this.label,
      required this.onTap,
      required this.clr,
      this.isClose = false,
      Key? key})
      : super(key: key);
  final String label;
  final Function() onTap;
  final Color clr;
  final bool isClose;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr,
            ),
            borderRadius: BorderRadius.circular(20),
            color: isClose ? Colors.transparent : clr),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        )),
      ),
    );
  }
}

Future<dynamic> showTaskBottomSheet(
    BuildContext context, TaskModel task) async {
  final TaskController taskController = Get.put(getIt<TaskController>());
  final NotificationService notificationService = getIt<NotificationService>();
  notificationService.requestIOSPermissions();
  notificationService.initializeNotification();
  return await Get.bottomSheet(SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 4),
      width: SizeConfig.screenWidth * 0.8,
      height: (SizeConfig.orientation == Orientation.landscape)
          ? (task.isCompleted == 1
              ? SizeConfig.screenHeight * 0.55
              : SizeConfig.screenHeight * 0.75)
          : (task.isCompleted == 1
              ? SizeConfig.screenHeight * 0.25
              : SizeConfig.screenHeight * 0.35),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Column(
        children: [
          Flexible(
            child: Container(
              height: 6,
              margin: const EdgeInsets.only(top: 10),
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      Get.isDarkMode ? Colors.grey[600]! : Colors.grey[300]!),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (task.isCompleted == 0)
            BuildBottomSheetItem(
                label: "Task Completed",
                onTap: () async {
                  await taskController.completeTask(task.id!);
                  notificationService.cancelNotification(task);
                  Get.back();
                },
                clr: Theme.of(context).primaryColor),
          BuildBottomSheetItem(
              label: "Delete Task",
              onTap: () async {
                await taskController.deleteTask(task);
                notificationService.cancelNotification(task);
                Get.back();
              },
              clr: Theme.of(context).primaryColor),
          BuildBottomSheetItem(
              label: "Cancel",
              onTap: () {
                Get.back();
              },
              clr: Theme.of(context).primaryColor),
        ],
      ),
    ),
  ));
}
