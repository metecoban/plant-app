import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle appSystemUiOverlayForBrightness(Brightness brightness) {
  final isDark = brightness == Brightness.dark;

  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
  );
}

SystemUiOverlayStyle appSystemUiOverlayForContext(BuildContext context) {
  return appSystemUiOverlayForBrightness(Theme.of(context).brightness);
}
