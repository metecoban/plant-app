import 'package:flutter/material.dart';

final class AppSpacing {
  const AppSpacing._();

  static const horizontal = 20.0;
  static const item = 16.0;
  static const section = 24.0;
  static const compact = 8.0;
  static const footnote = 10.0;
  static const footer = 54.0;
  static const secondaryRowHeight = 36.0;

  static const horizontalPadding = EdgeInsets.symmetric(horizontal: horizontal);

  static double contentWidth(double viewportWidth) =>
      viewportWidth - (horizontal * 2);
}
