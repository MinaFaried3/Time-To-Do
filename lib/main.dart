import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_clean_architecture/core/services/service_locator.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme/dark.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme/light.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/theme_sevice.dart';
import 'package:todo_clean_architecture/data/datasource/local/sql.dart';
import 'package:todo_clean_architecture/presentation/screens/home_screen_desktop.dart';
import 'package:todo_clean_architecture/presentation/screens/home_screen_mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColor.darkGreyClr, // navigation bar color
    // status bar color
  ));
  await GetStorage.init();
  await DatabaseService.initDB();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo app',
      theme: LightTheme.light,
      darkTheme: DarkTheme.dark,
      themeMode: ThemeService().theme,
      home: LayoutBuilder(
        builder: (context, constrain) {
          if (constrain.minWidth.toInt() >= 400)
            return HomeScreenDesktop();
          else
            return HomeScreen();
        },
      ),
    );
  }
}
