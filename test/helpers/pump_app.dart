import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/core/i18n/strings.g.dart';

Future<void> pumpLocalizedWidget(WidgetTester tester, Widget child) async {
  await LocaleSettings.setLocale(AppLocale.en);
  await tester.pumpWidget(TranslationProvider(child: MaterialApp(home: child)));
}
