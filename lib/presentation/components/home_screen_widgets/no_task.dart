import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    bool orientation = SizeConfig.orientation == Orientation.landscape;
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutExpo,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: orientation ? Axis.horizontal : Axis.vertical,
            children: [
              orientation
                  ? const SizedBox(
                      height: 50,
                    )
                  : const SizedBox(
                      height: 150,
                    ),
              SvgPicture.asset(
                "images/task.svg",
                height: 100,
                color: themes.primaryColor.withOpacity(0.5),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                child: Text(
                  "You don't have any tasks yet!\nAdd new Tasks to make your days more productive ",
                  style: themes.textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              orientation
                  ? const SizedBox(
                      height: 50,
                    )
                  : const SizedBox(
                      height: 100,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
