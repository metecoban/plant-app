import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';
import 'package:plant_app/shared/widgets/common_empty_view.dart';
import 'package:plant_app/shared/widgets/common_error_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../helpers/home_fixtures.dart';
import '../../../../helpers/pump_app.dart';

class _HomeStatePreview extends StatelessWidget {
  const _HomeStatePreview({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      HomeInitial() || HomeLoading() => const Skeletonizer(
        child: Center(child: Text('loading-placeholder')),
      ),
      HomeEmpty() => CommonEmptyView(message: t.home.emptyMessage),
      HomeFailure(:final failure) => CommonErrorView(message: failure.message),
      HomeSuccess(:final plants) => Scaffold(
        body: ListView(
          children: [
            for (final plant in plants) ListTile(title: Text(plant.title)),
          ],
        ),
      ),
    };
  }
}

void main() {
  testWidgets('shows loading placeholder while home is loading', (
    tester,
  ) async {
    await pumpLocalizedWidget(
      tester,
      const _HomeStatePreview(state: HomeState.loading()),
    );

    expect(find.text('loading-placeholder'), findsOneWidget);
  });

  testWidgets('shows error view when home fails', (tester) async {
    await pumpLocalizedWidget(
      tester,
      const _HomeStatePreview(
        state: HomeState.failure(
          failure: Failure(type: FailureType.server, message: 'Server error'),
        ),
      ),
    );

    expect(find.text('Server error'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('shows empty view when home has no content', (tester) async {
    await pumpLocalizedWidget(
      tester,
      const _HomeStatePreview(state: HomeState.empty()),
    );

    expect(find.text('No content available yet.'), findsOneWidget);
  });

  testWidgets('shows plant titles on success', (tester) async {
    await pumpLocalizedWidget(
      tester,
      _HomeStatePreview(
        state: HomeState.success(
          questions: [sampleQuestion],
          plants: [samplePlant],
        ),
      ),
    );

    expect(find.text('Edible Plants'), findsOneWidget);
  });
}
