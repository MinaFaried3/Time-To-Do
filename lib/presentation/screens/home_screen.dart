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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
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
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TaskBar(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: DatePikerBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: ShowTasks(),
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
