import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme/dark.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme/light.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme_sevice.dart';
import 'package:todo_clean_architecture/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDo app',
      theme: LightTheme.light,
      darkTheme: DarkTheme.dark,
      themeMode: ThemeService().theme,
      home: const HomeScreen(),
    );
  }
}
