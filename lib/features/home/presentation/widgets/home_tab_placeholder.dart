import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';

class HomeTabPlaceholder extends StatelessWidget {
  const HomeTabPlaceholder({required this.title, super.key});

  final String title;

  static const bottomNavInset = 88.0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.homeBackground,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.horizontal,
          0,
          AppSpacing.horizontal,
          bottomNavInset,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.appColors.mainText,
            ),
          ),
        ),
      ),
    );
  }
}
