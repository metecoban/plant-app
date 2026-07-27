import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/core/storage/local_storage.dart';
import 'package:plant_app/core/storage/storage_keys.dart';
import 'package:plant_app/features/app_flow/data/repositories/app_flow_repository_impl.dart';
import 'package:plant_app/features/app_flow/domain/entities/app_flow_destination.dart';

class _MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late _MockLocalStorage storage;
  late AppFlowRepositoryImpl repository;

  setUp(() {
    storage = _MockLocalStorage();
    repository = AppFlowRepositoryImpl(storage);
  });

  group('getDestination', () {
    test('returns onboarding when onboarding is not completed', () async {
      when(
        () => storage.getBool(StorageKeys.onboardingCompleted),
      ).thenAnswer((_) async => false);

      final result = await repository.getDestination();

      expect(result, isA<Success<AppFlowDestination>>());
      expect((result as Success).data, AppFlowDestination.onboarding);
    });

    test(
      'returns paywall when onboarding completed but paywall is not',
      () async {
        when(
          () => storage.getBool(StorageKeys.onboardingCompleted),
        ).thenAnswer((_) async => true);
        when(
          () => storage.getBool(StorageKeys.paywallCompleted),
        ).thenAnswer((_) async => false);

        final result = await repository.getDestination();

        expect(result, isA<Success<AppFlowDestination>>());
        expect((result as Success).data, AppFlowDestination.paywall);
      },
    );

    test('returns home when onboarding and paywall are completed', () async {
      when(
        () => storage.getBool(StorageKeys.onboardingCompleted),
      ).thenAnswer((_) async => true);
      when(
        () => storage.getBool(StorageKeys.paywallCompleted),
      ).thenAnswer((_) async => true);

      final result = await repository.getDestination();

      expect(result, isA<Success<AppFlowDestination>>());
      expect((result as Success).data, AppFlowDestination.home);
    });
  });

  group('completeOnboarding', () {
    test(
      'writes onboarding completion to storage and returns paywall',
      () async {
        when(
          () => storage.setBool(StorageKeys.onboardingCompleted, value: true),
        ).thenAnswer((_) async => true);

        final result = await repository.completeOnboarding();

        expect(result, isA<Success<AppFlowDestination>>());
        expect((result as Success).data, AppFlowDestination.paywall);
        verify(
          () => storage.setBool(StorageKeys.onboardingCompleted, value: true),
        ).called(1);
      },
    );
  });

  group('completePaywall', () {
    test('writes paywall completion to storage and returns home', () async {
      when(
        () => storage.setBool(StorageKeys.paywallCompleted, value: true),
      ).thenAnswer((_) async => true);

      final result = await repository.completePaywall();

      expect(result, isA<Success<AppFlowDestination>>());
      expect((result as Success).data, AppFlowDestination.home);
      verify(
        () => storage.setBool(StorageKeys.paywallCompleted, value: true),
      ).called(1);
    });
  });
}
