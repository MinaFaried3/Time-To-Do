import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;

  late double screenWidth;
  late double screenHeight;
  late double bodyHeight;
  // late double defaultSize;
  late Orientation orientation;

  SizeConfig(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
    bodyHeight = screenHeight;
  }

  void setBodyHeight(
    BuildContext context, {
    double appBarHeight = 0,
    double statusBarHeight = 0,
  }) {
    bodyHeight = screenHeight - appBarHeight - statusBarHeight;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight, BuildContext context) {
  final sizeConfig = SizeConfig(context);

  double screenHeight = sizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth, BuildContext context) {
  final sizeConfig = SizeConfig(context);

  double screenWidth = sizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
