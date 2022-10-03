import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/presentation/components/home_screen_widgets/show_task_grid.dart';
import 'package:todo_clean_architecture/presentation/screens/add_task_screen.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/global/notification/notification_service.dart';
import '../../core/utils/global/shared/size_config.dart';
import '../../core/utils/global/themes/theme_sevice.dart';
import '../components/avatar.dart';
import '../components/home_screen_widgets/date_piker_bar.dart';
import '../controller/task_controller.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  final TaskController taskController = Get.put(getIt<TaskController>());
  late NotificationService notificationService;
  @override
  void initState() {
    super.initState();
    taskController.getTasks();
    notificationService = getIt<NotificationService>();
    notificationService.requestIOSPermissions();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    sizeConfig.setBodyHeight(context,
        statusBarHeight: SizeConfig.mediaQueryData.padding.top);
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Avatar(
                    radius: sizeConfig.screenWidth * 0.02,
                  ),
                  IconButton(
                      onPressed: () async {
                        await taskController.deleteAll();
                        await notificationService.cancelAllNotification();
                      },
                      icon: Icon(
                        Icons.cleaning_services_rounded,
                        color: Theme.of(context).primaryColor,
                      )),
                  IconButton(
                    icon: Icon(
                        Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light,
                        color: Theme.of(context).primaryColor),
                    onPressed: () async {
                      ThemeService().switchTheme();
                      setState(() {});
                      await taskController.getTasks();
                    },
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () async {
                        await Get.to(() => const AddTaskScreen());
                      },
                      icon: Icon(Icons.add_outlined,
                          color: Theme.of(context).primaryColor))
                ],
              ),
            ),
            SizedBox(
              width: sizeConfig.screenWidth * 0.08,
              child: const DatePikerBar(
                axis: Axis.vertical,
              ),
            ),
            SizedBox(
                width: sizeConfig.screenWidth * 0.7,
                child: const GridShowTasks())
          ],
        ),
      ),
    );
  }
}
