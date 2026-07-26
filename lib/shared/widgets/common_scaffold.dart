import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.body,
    this.appBar,
    this.backgroundType = AppBackground.standard,
    this.useSafeArea = true,
    this.padding,
    this.floatingActionButton,
    this.bottomNavigationBar,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final AppBackground backgroundType;
  final bool useSafeArea;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final resolvedPadding =
        padding ??
        const EdgeInsets.symmetric(horizontal: AppSpacing.horizontal);

    return Scaffold(
      backgroundColor: colors.backgroundFor(backgroundType),
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final content = Padding(padding: resolvedPadding, child: body);

          if (!useSafeArea) {
            return content;
          }

          return SafeArea(child: content);
        },
      ),
    );
  }
}
