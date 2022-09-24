import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/presentation/controller/task_controller.dart';

class DatePikerBar extends StatefulWidget {
  const DatePikerBar({Key? key}) : super(key: key);

  @override
  State<DatePikerBar> createState() => _DatePikerBarState();
}

class _DatePikerBarState extends State<DatePikerBar> {
  TaskController taskController = Get.put(getIt<TaskController>());
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) => PhysicalModel(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        elevation: Get.isDarkMode ? 17 : 0,
        shadowColor: Get.isDarkMode
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 60,
          initialSelectedDate: taskController.selectedDate,
          selectedTextColor: Colors.white,
          deactivatedColor: Colors.black,
          selectionColor: Theme.of(context).primaryColor,
          dayTextStyle: Theme.of(context).textTheme.bodyText2!,
          dateTextStyle: Theme.of(context).textTheme.headline4!,
          monthTextStyle: Theme.of(context).textTheme.subtitle2!,
          onDateChange: (newDate) async {
            await taskController.changeSelectedDate(newDate);
          },
        ),
      ),
    );
  }
}
