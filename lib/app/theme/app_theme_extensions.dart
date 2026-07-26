import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';

extension AppThemeX on BuildContext {
  AppColors get appColors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.light;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
