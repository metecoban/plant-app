import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_status.dart';

void main() {
  Future<void> runAndCollect(
    OnboardingCubit cubit,
    void Function() action,
    void Function() expectations,
  ) async {
    final subscription = cubit.stream.listen((_) {});
    action();
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();
    expectations();
    await cubit.close();
  }

  group('OnboardingCubit', () {
    test('starts at page index 0', () {
      final cubit = OnboardingCubit();

      expect(cubit.state.pageIndex, 0);
      expect(cubit.state.status, OnboardingStatus.initial);

      cubit.close();
    });

    test('next advances page index on non-last pages', () async {
      final cubit = OnboardingCubit();

      await runAndCollect(cubit, cubit.next, () {
        expect(cubit.state.pageIndex, 1);
        expect(cubit.state.status, OnboardingStatus.initial);
      });
    });

    test('next on last page marks onboarding as completed', () async {
      final cubit = OnboardingCubit()..onPageChanged(2);

      await runAndCollect(cubit, cubit.next, () {
        expect(cubit.state.pageIndex, 2);
        expect(cubit.state.status, OnboardingStatus.completed);
      });
    });

    test('skip marks onboarding as completed', () async {
      final cubit = OnboardingCubit();

      await runAndCollect(cubit, cubit.skip, () {
        expect(cubit.state.status, OnboardingStatus.completed);
      });
    });

    test('onPageChanged updates page index', () async {
      final cubit = OnboardingCubit();

      await runAndCollect(cubit, () => cubit.onPageChanged(1), () {
        expect(cubit.state.pageIndex, 1);
      });
    });

    test('onPageChanged ignores duplicate index', () async {
      final cubit = OnboardingCubit();

      await runAndCollect(cubit, () => cubit.onPageChanged(0), () {
        expect(cubit.state.pageIndex, 0);
      });
    });
  });
}
