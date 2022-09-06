import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/presentation/components/button.dart';
import 'package:todo_clean_architecture/presentation/controller/task_conroller.dart';
import 'package:todo_clean_architecture/presentation/screens/add_task_screen.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              await Get.to(const AddTaskScreen());
              taskController.getTasks();
            })
      ],
    );
  }
}
