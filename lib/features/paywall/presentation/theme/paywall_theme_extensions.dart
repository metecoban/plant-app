import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';

extension PaywallThemeX on BuildContext {
  TextStyle? get paywallTitleStyle =>
      textTheme.labelLarge?.copyWith(color: AppPalette.darkMainText);

  TextStyle? get paywallSubtitleStyle =>
      textTheme.bodySmall?.copyWith(color: AppPalette.darkSubText);
}
