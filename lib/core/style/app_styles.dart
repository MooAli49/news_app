import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class AppStyles {
  static const String fontFamily = 'Roboto';

  static const TextStyle font17Weight800Red = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w800,
    color: ColorsManger.redColor,
    fontFamily: 'Inter',
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );
}
