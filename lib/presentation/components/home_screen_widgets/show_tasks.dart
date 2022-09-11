import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';
import 'package:todo_clean_architecture/presentation/components/task_tile.dart';

class ShowTasks extends StatelessWidget {
  const ShowTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    bool orientation = SizeConfig.orientation == Orientation.landscape;
    return TaskTile(
      TaskModel(
          color: 1,
          endTime: "2:00 pm",
          startTime: "2:00 pm",
          isCompleted: 1,
          note:
              "vipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisvvipw ivdw ibdvsa abov aibnvd baoisv",
          title: "Mina "),
    );
  }
}
