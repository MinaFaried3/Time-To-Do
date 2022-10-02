import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key, this.toDayTask = true})
      : super(key: key);
  final TaskModel task;
  final bool toDayTask;
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    // sizeConfig.setBodyHeight(context,
    //     appBarHeight: appBar.preferredSize.height,
    //     statusBarHeight: SizeConfig.mediaQueryData.padding.top);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              sizeConfig.orientation == Orientation.landscape ? 4 : 8, context),
          vertical: 10),
      width: sizeConfig.orientation == Orientation.landscape
          ? sizeConfig.screenWidth / 2
          : sizeConfig.screenWidth,
      margin: EdgeInsets.all(getProportionateScreenHeight(10, context)),
      decoration: BoxDecoration(
          color: getClr(task.color),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: getShadow(task.color, Get.isDarkMode ? 0.4 : 0.7),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(4, 9)),
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

  Color getClr(int? color) {
    Map colors = {
      0: AppColor.bluishClr,
      1: AppColor.pinkClr,
      2: AppColor.orangeClr
    };

    return toDayTask ? colors[color] : Colors.grey;
  }

  getShadow(int? color, double opacity) {
    return getClr(color).withOpacity(opacity);
  }
}
