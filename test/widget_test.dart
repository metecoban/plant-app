import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/app/app.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await LocaleSettings.setLocale(AppLocale.en);
    await configureDependencies();
  });

  testWidgets('App opens onboarding when flow is incomplete', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(TranslationProvider(child: const App()));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
  });
}
