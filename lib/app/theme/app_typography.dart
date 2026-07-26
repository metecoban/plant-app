import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';

final class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(AppColors colors) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1,
        color: colors.mainText,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 28,
        fontWeight: FontWeight.w300,
        height: 1,
        color: colors.mainText,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.2,
        letterSpacing: 0.38,
        color: colors.mainText,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 20 / 15,
        color: colors.mainText,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: colors.subText,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: colors.mainText,
      ),
    );
  }
}
