import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/presentation/controller/task_controller.dart';

import '../../../core/utils/global/shared/size_config.dart';
import '../date-piker_verical/picker.dart';

class DatePikerBar extends StatefulWidget {
  const DatePikerBar({Key? key, this.axis = Axis.horizontal}) : super(key: key);

  final Axis axis;

  @override
  State<DatePikerBar> createState() => _DatePikerBarState();
}

class _DatePikerBarState extends State<DatePikerBar> {
  TaskController taskController = Get.put(getIt<TaskController>());
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    sizeConfig.setBodyHeight(context,
        statusBarHeight: SizeConfig.mediaQueryData.padding.top);
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
          height: sizeConfig.isLandScape() ? double.infinity : 100,
          axis: widget.axis,
          width: sizeConfig.screenWidth * 0.17,
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
