import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DatePikerBar extends StatefulWidget {
  const DatePikerBar({Key? key}) : super(key: key);

  @override
  State<DatePikerBar> createState() => _DatePikerBarState();
}

class _DatePikerBarState extends State<DatePikerBar> {
  @override
  Widget build(BuildContext context) {
    var selectedDate = DateTime.now();
    return StatefulBuilder(
      builder: (context, state) => PhysicalModel(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        elevation: Get.isDarkMode ? 17 : 0,
        shadowColor: Get.isDarkMode
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        child: DatePicker(
          selectedDate,
          height: 100,
          width: 60,
          initialSelectedDate: selectedDate,
          selectedTextColor: Colors.white,
          deactivatedColor: Colors.black,
          selectionColor: Theme.of(context).primaryColor,
          dayTextStyle: Theme.of(context).textTheme.bodyText2!,
          dateTextStyle: Theme.of(context).textTheme.headline4!,
          monthTextStyle: Theme.of(context).textTheme.subtitle2!,
          onDateChange: (newDate) {
            state(() {
              // selectedDate = newDate;
            });
          },
        ),
      ),
    );
  }
}
