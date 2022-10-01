import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/global/notification/notification_service.dart';
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
    var appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              await taskController.deleteAll();
              await notificationService.cancelAllNotification();
            },
            icon: const Icon(Icons.cleaning_services_rounded)),
        const Avatar(),
      ],
      leading: IconButton(
        icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light),
        onPressed: () async {
          ThemeService().switchTheme();
          setState(() {});
          await taskController.getTasks();
        },
      ),
    );

    final sizeConfig = SizeConfig(context);
    sizeConfig.setBodyHeight(context,
        appBarHeight: appBar.preferredSize.height,
        statusBarHeight: SizeConfig.mediaQueryData.padding.top);

    return Scaffold(
      appBar: appBar,
      body: RefreshIndicator(
        onRefresh: () async {
          await taskController.getTasks();
        },
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: sizeConfig.bodyHeight * 0.10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeConfig.screenWidth * 0.02),
                      child: const TaskBar(),
                    ),
                  ),
                  SizedBox(
                    height: sizeConfig.bodyHeight * 0.15,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: sizeConfig.screenWidth * 0.02),
                      child: const DatePikerBar(),
                    ),
                  ),
                  SizedBox(
                    height: sizeConfig.bodyHeight * 0.73,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: sizeConfig.bodyHeight * 0.02),
                      child: const ShowTasks(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
