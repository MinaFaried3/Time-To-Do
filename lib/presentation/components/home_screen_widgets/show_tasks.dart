import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/presentation/components/home_screen_widgets/no_task.dart';

class ShowTasks extends StatelessWidget {
  const ShowTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    bool orientation = SizeConfig.orientation == Orientation.landscape;
    return const NoTasks();
  }
}
