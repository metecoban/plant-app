import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_actions.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders get started button on first onboarding page', (
    tester,
  ) async {
    await pumpLocalizedWidget(
      tester,
      Scaffold(
        body: OnboardingActions(
          pageIndex: 0,
          pageCount: 3,
          pageIndicatorActiveIndex: 0,
          onPrimaryPressed: () {},
          onSkipPressed: () {},
        ),
      ),
    );

    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Continue'), findsNothing);
  });

  testWidgets('renders continue button on later onboarding pages', (
    tester,
  ) async {
    await pumpLocalizedWidget(
      tester,
      Scaffold(
        body: OnboardingActions(
          pageIndex: 1,
          pageCount: 3,
          pageIndicatorActiveIndex: 0,
          onPrimaryPressed: () {},
          onSkipPressed: () {},
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Get Started'), findsNothing);
  });
}
