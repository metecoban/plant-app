import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.size = 24,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: IconTheme(
        data: IconThemeData(
          color: onPressed == null ? colors.subText : colors.mainText,
          size: size,
        ),
        child: icon,
      ),
    );
  }
}
