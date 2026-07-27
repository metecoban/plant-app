import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_cubit.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_plan.dart';
import 'package:plant_app/features/paywall/presentation/cubit/paywall_status.dart';

void main() {
  Future<void> runAndCollect(
    PaywallCubit cubit,
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

  group('PaywallCubit', () {
    test('starts with yearly plan selected', () {
      final cubit = PaywallCubit();

      expect(cubit.state.selectedPlan, PaywallPlan.yearly);
      expect(cubit.state.status, PaywallStatus.initial);

      cubit.close();
    });

    test('selectPlan changes selected plan', () async {
      final cubit = PaywallCubit();

      await runAndCollect(
        cubit,
        () => cubit.selectPlan(PaywallPlan.monthly),
        () => expect(cubit.state.selectedPlan, PaywallPlan.monthly),
      );
    });

    test('selectPlan ignores selecting the same plan', () async {
      final cubit = PaywallCubit();
      var emitCount = 0;
      final subscription = cubit.stream.listen((_) => emitCount++);

      cubit.selectPlan(PaywallPlan.yearly);
      await Future<void>.delayed(Duration.zero);

      expect(emitCount, 0);

      await subscription.cancel();
      await cubit.close();
    });

    test('subscribe marks paywall as completed', () async {
      final cubit = PaywallCubit();

      await runAndCollect(cubit, cubit.subscribe, () {
        expect(cubit.state.status, PaywallStatus.completed);
      });
    });

    test('dismiss marks paywall as completed', () async {
      final cubit = PaywallCubit();

      await runAndCollect(cubit, cubit.dismiss, () {
        expect(cubit.state.status, PaywallStatus.completed);
      });
    });
  });
}
