import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';
import 'package:todo_clean_architecture/presentation/components/notification/tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  final String payload;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late String _payload;

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          _payload.split('|')[0],
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  "hello hassan",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color:
                          Get.isDarkMode ? Colors.white : AppColor.darkGreyClr),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "you have a new reminder",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Get.isDarkMode
                          ? Colors.grey[300]
                          : AppColor.darkGreyClr),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.primaryClr,
                ),
                child: SingleChildScrollView(
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NotificationTile(
                            title: "Title", icon: Icons.text_format),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _payload.split('|')[0],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const NotificationTile(
                            title: "Description",
                            icon: Icons.description_outlined),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _payload.split('|')[1],
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const NotificationTile(
                            title: "Time", icon: Icons.watch_later_outlined),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _payload.split('|')[2],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
