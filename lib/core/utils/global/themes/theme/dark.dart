import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';

class DarkTheme extends Equatable {
  static final ThemeData dark = ThemeData(
    primaryColor: AppColor.primaryClr,
    backgroundColor: AppColor.darkGreyClr,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.darkGreyClr,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.primaryClr),
      backgroundColor: AppColor.darkGreyClr,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.darkGreyClr,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.darkGreyClr,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: AppColor.darkGreyClr,
      ),
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline3: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      headline4: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
      ),
      bodyText1: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(
          color: Colors.grey[200],
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      subtitle1: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle2: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ),
  );
  @override
  List<Object?> get props => [dark];
}
