import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/presentation/components/button.dart';

import '../../core/utils/global/themes/theme_sevice.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            ThemeService().switchTheme();
            Get.to(NotificationScreen(
              payload: "title|description|10:30",
            ));
          },
        ),
      ),
      body: Center(
        child: MyButton(
          label: 'add task',
          onTap: () {},
        ),
      ),
    );
  }
}
