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
    scaffoldBackgroundColor: AppColor.darkBackClr,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.darkBackClr,
          statusBarIconBrightness: Brightness.light),
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
      bodyText1: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(
          color: Colors.grey[200],
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      subtitle1: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
  @override
  List<Object?> get props => [dark];
}
