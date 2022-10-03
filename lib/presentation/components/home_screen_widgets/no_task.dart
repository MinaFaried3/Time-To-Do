import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    sizeConfig.setBodyHeight(context,
        statusBarHeight: SizeConfig.mediaQueryData.padding.top);
    var themes = Theme.of(context);
    bool orientation = sizeConfig.orientation == Orientation.landscape;

    List<Widget> items = [
      orientation
          ? SizedBox(
              width: sizeConfig.screenWidth * 0.01,
            )
          : SizedBox(
              height: sizeConfig.bodyHeight * 0.2,
            ),
      SvgPicture.asset(
        "images/task.svg",
        height: orientation
            ? sizeConfig.bodyHeight * 0.3
            : sizeConfig.screenWidth * 0.3,
        color: themes.primaryColor.withOpacity(0.5),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: sizeConfig.bodyHeight * 0.04,
            horizontal: orientation
                ? sizeConfig.screenWidth * 0.03
                : sizeConfig.screenWidth * 0.1),
        child: Text(
          "You don't have any tasks yet!\nAdd new Tasks to make your days more productive ",
          style: themes.textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ),
    ];
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutExpo,
          child: orientation
              ? Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: items,
                  ),
                )
              : Column(
                  children: items,
                ),
        )
      ],
    );
  }
}
