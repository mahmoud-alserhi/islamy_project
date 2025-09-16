import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_resource.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: ColorResource.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorResource.white,
    cardColor: ColorResource.white,
    dividerColor: ColorResource.lightGray,
    hintColor: ColorResource.mediumGray,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorResource.white,
      foregroundColor: ColorResource.black,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: ColorResource.black,
      ),
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: ColorResource.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorResource.mediumGray,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorResource.white,
      contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorResource.lightGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorResource.lightGray),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: ColorResource.primary,
      secondary: ColorResource.secondary,
      surface: ColorResource.white,
      background: ColorResource.white,
      onSurface: ColorResource.black,
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: ColorResource.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorResource.black,
    cardColor: ColorResource.cardBackgroundDark,
    dividerColor: ColorResource.borderGrayDark,
    hintColor: ColorResource.mediumGrayDark,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorResource.surfaceDark,
      foregroundColor: ColorResource.white,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: ColorResource.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: ColorResource.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorResource.mediumGrayDark,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorResource.surfaceDark,
      contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorResource.borderGrayDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorResource.borderGrayDark),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: ColorResource.primary,
      secondary: ColorResource.secondary,
      surface: ColorResource.surfaceDark,
      background: ColorResource.black,
      onSurface: ColorResource.white,
    ),
  );
}
