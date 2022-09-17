import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/global/themes/theme_sevice.dart';
import '../components/avatar.dart';
import '../components/home_screen_widgets/date_piker_bar.dart';
import '../components/home_screen_widgets/show_tasks.dart';
import '../components/home_screen_widgets/task_bar.dart';
import '../controller/task_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController = Get.put(getIt<TaskController>());
  @override
  void initState() {
    super.initState();
    taskController.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [Avatar()],
        leading: IconButton(
          icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light),
          onPressed: () async {
            ThemeService().switchTheme();
            setState(() {});
            await taskController.getTasks();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TaskBar(),
              SizedBox(
                height: 15,
              ),
              DatePikerBar(),
              SizedBox(
                height: 15,
              ),
              ShowTasks()
            ],
          ),
        ),
      ),
    );
  }
}
