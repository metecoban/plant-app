import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/app/app.dart';
import 'package:plant_app/core/i18n/strings.g.dart';

void main() {
  setUpAll(() {
    LocaleSettings.setLocale(AppLocale.en);
  });

  testWidgets('App renders placeholder home', (WidgetTester tester) async {
    await tester.pumpWidget(TranslationProvider(child: const App()));

    expect(find.text('Plant App'), findsOneWidget);
  });
}
