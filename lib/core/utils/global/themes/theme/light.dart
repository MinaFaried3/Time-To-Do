import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';

class LightTheme extends Equatable {
  static final ThemeData light = ThemeData(
    primaryColor: AppColor.primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline3: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      bodyText1: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black,
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
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
  @override
  List<Object?> get props => [light];
}
