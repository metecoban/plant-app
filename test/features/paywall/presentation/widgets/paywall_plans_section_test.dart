import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_plan.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_plans_section.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('updates selected plan when an option is tapped', (tester) async {
    var selectedPlan = PaywallPlan.yearly;

    await pumpLocalizedWidget(
      tester,
      StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: PaywallPlansSection(
              selectedPlan: selectedPlan,
              onPlanSelected: (plan) => setState(() => selectedPlan = plan),
            ),
          );
        },
      ),
    );

    expect(find.text('1 Month'), findsOneWidget);
    expect(find.text('1 Year'), findsOneWidget);

    await tester.tap(find.text('1 Month'));
    await tester.pump();

    expect(selectedPlan, PaywallPlan.monthly);
  });
}
