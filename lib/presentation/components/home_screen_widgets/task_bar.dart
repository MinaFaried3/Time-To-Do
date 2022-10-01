import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/presentation/components/button.dart';
import 'package:todo_clean_architecture/presentation/screens/add_task_screen.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Today",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
        MyButton(
            label: "+ Add Task",
            onTap: () async {
              await Get.to(() => const AddTaskScreen());
            })
      ],
    );
  }
}
