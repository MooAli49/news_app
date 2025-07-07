import 'package:flutter/material.dart';

import 'colors_manger.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsManger.redColor,
    scaffoldBackgroundColor: ColorsManger.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManger.whiteColor,
      iconTheme: IconThemeData(color: ColorsManger.darkGreyColor),
      titleTextStyle: TextStyle(
        color: ColorsManger.redColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorsManger.blackColor),
      bodyMedium: TextStyle(color: ColorsManger.darkGreyColor),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsManger.blueColor,
    scaffoldBackgroundColor: ColorsManger.darkGreyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManger.darkGreyColor,
      iconTheme: IconThemeData(color: ColorsManger.whiteColor),
      titleTextStyle: TextStyle(
        color: ColorsManger.yellowColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorsManger.whiteColor),
      bodyMedium: TextStyle(color: ColorsManger.lightGreyColor),
    ),
  );
}
