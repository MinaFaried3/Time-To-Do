import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';

import '../../core/utils/global/shared/size_config.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: sizeConfig.isLandScape()
            ? sizeConfig.screenWidth * 0.2
            : sizeConfig.screenWidth * 0.4,
        height: sizeConfig.isLandScape()
            ? sizeConfig.screenHeight * 0.13
            : sizeConfig.screenHeight * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primaryClr),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
