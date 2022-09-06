import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/notification/notification_service.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/presentation/components/home_screen_widgets/show_tasks.dart';

import '../../core/utils/global/themes/theme_sevice.dart';
import '../components/avatat.dart';
import '../components/home_screen_widgets/date_piker_bar.dart';
import '../components/home_screen_widgets/task_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotificationService notificationService;
  @override
  void initState() {
    super.initState();
    notificationService = NotificationService();
    notificationService.requestIOSPermissions();
    notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [Avatar()],
        leading: IconButton(
          icon: Icon(Get.isDarkMode ? Icons.dark_mode_outlined : Icons.light),
          onPressed: () {
            ThemeService().switchTheme();
            setState(() {});
            NotificationService()
                .displayNotification(title: "Theme changed", body: "body");
            NotificationService().scheduledNotification();
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
