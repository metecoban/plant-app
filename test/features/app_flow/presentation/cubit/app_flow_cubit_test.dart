import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/app_flow/domain/entities/app_flow_destination.dart';
import 'package:plant_app/features/app_flow/domain/repositories/app_flow_repository.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_status.dart';

class _MockAppFlowRepository extends Mock implements AppFlowRepository {}

void main() {
  late _MockAppFlowRepository repository;

  setUp(() {
    repository = _MockAppFlowRepository();
  });

  AppFlowCubit buildCubit() => AppFlowCubit(repository);

  Future<AppFlowCubit> runFlowAction(
    AppFlowCubit cubit,
    Future<void> Function() action,
  ) async {
    final subscription = cubit.stream.listen((_) {});
    await action();
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();
    return cubit;
  }

  group('loadFlow', () {
    test('emits onboardingRequired when onboarding is not completed', () async {
      when(
        () => repository.getDestination(),
      ).thenAnswer((_) async => const Success(AppFlowDestination.onboarding));

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.loadFlow);

      expect(cubit.state.status, AppFlowStatus.onboardingRequired);
      await cubit.close();
    });

    test('emits paywallRequired when onboarding is completed', () async {
      when(
        () => repository.getDestination(),
      ).thenAnswer((_) async => const Success(AppFlowDestination.paywall));

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.loadFlow);

      expect(cubit.state.status, AppFlowStatus.paywallRequired);
      await cubit.close();
    });

    test('emits home when flow is fully completed', () async {
      when(
        () => repository.getDestination(),
      ).thenAnswer((_) async => const Success(AppFlowDestination.home));

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.loadFlow);

      expect(cubit.state.status, AppFlowStatus.home);
      await cubit.close();
    });

    test('emits failure when repository fails', () async {
      when(() => repository.getDestination()).thenAnswer(
        (_) async => const FailureResult(
          Failure(type: FailureType.storage, message: 'Storage failed'),
        ),
      );

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.loadFlow);

      expect(cubit.state.status, AppFlowStatus.failure);
      expect(cubit.state.failure?.type, FailureType.storage);
      await cubit.close();
    });
  });

  group('completeOnboarding', () {
    test('emits paywallRequired after onboarding completion', () async {
      when(
        () => repository.completeOnboarding(),
      ).thenAnswer((_) async => const Success(AppFlowDestination.paywall));

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.completeOnboarding);

      expect(cubit.state.status, AppFlowStatus.paywallRequired);
      await cubit.close();
    });
  });

  group('completePaywall', () {
    test('emits home after paywall completion', () async {
      when(
        () => repository.completePaywall(),
      ).thenAnswer((_) async => const Success(AppFlowDestination.home));

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.completePaywall);

      expect(cubit.state.status, AppFlowStatus.home);
      await cubit.close();
    });

    test('emits failure when paywall completion fails', () async {
      when(() => repository.completePaywall()).thenAnswer(
        (_) async => const FailureResult(
          Failure(type: FailureType.storage, message: 'Could not save'),
        ),
      );

      final cubit = buildCubit();
      await runFlowAction(cubit, cubit.completePaywall);

      expect(cubit.state.status, AppFlowStatus.failure);
      expect(cubit.state.failure?.message, 'Could not save');
      await cubit.close();
    });
  });
}
