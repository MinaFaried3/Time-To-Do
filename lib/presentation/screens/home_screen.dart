import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

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
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TaskBar(),
              SizedBox(
                height: 15,
              ),
              DatePikerBar()
            ],
          ),
        ),
      ),
    );
  }
}
