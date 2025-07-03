import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class AppStyles {
  static const String fontFamily = 'Roboto';

  static const TextStyle font17Weight800Red = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w800,
    color: ColorsManger.redColor,
    letterSpacing: 6,
    fontFamily: 'Inter',
  );

  static const TextStyle font16Weight800Blue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: ColorsManger.blueColor,
    fontFamily: fontFamily,
  );

  static const TextStyle font9Weight800Blue = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: ColorsManger.blueColor,
    fontFamily: fontFamily,
  );

  static const TextStyle font9Weight800 = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const TextStyle font9Weight800Yellow = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: ColorsManger.yellowColor,
    fontFamily: fontFamily,
  );

  static const TextStyle font12Weight800White = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    color: ColorsManger.whiteColor,
    fontFamily: fontFamily,
  );
  static const TextStyle font12Wieght800 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static const TextStyle font16Weight500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const TextStyle font14Weight600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}
