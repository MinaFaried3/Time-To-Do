import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';

class TaskTile extends StatelessWidget {
  TaskTile(this.task, {Key? key}) : super(key: key);
  late TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
            SizeConfig.orientation == Orientation.landscape ? 4 : 8,
          ),
          vertical: 10),
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      margin: EdgeInsets.all(getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          color: getClr(task.color),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: getShadow(task.color, Get.isDarkMode ? 0.4 : 0.7),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(4, 9)),
          ]),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      task.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey[200],
                        size: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RichText(
                          text: TextSpan(
                              text: task.startTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.normal),
                              children: [
                            const TextSpan(text: ' - '),
                            TextSpan(text: task.endTime),
                          ]))
                    ]),
                  ),
                  Text(
                    task.note!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.white,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted == 0 ? "TODO" : "COMPLETED",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  getClr(int? color) {
    Map colors = {
      0: AppColor.bluishClr,
      1: AppColor.pinkClr,
      2: AppColor.orangeClr
    };

    return colors[color];
  }

  getShadow(int? color, double opacity) {
    Map colors = {
      0: AppColor.bluishClr.withOpacity(opacity),
      1: AppColor.pinkClr.withOpacity(opacity),
      2: AppColor.orangeClr.withOpacity(opacity)
    };

    return colors[color];
  }
}
