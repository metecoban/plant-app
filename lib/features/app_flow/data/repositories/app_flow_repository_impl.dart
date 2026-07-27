import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/error_mapper.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/core/storage/local_storage.dart';
import 'package:plant_app/core/storage/storage_keys.dart';
import 'package:plant_app/features/app_flow/domain/entities/app_flow_destination.dart';
import 'package:plant_app/features/app_flow/domain/repositories/app_flow_repository.dart';

@LazySingleton(as: AppFlowRepository)
class AppFlowRepositoryImpl implements AppFlowRepository {
  const AppFlowRepositoryImpl(this._localStorage);

  final LocalStorage _localStorage;

  @override
  Future<Result<AppFlowDestination>> getDestination() async {
    try {
      return Success(await _resolveDestination());
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }

  @override
  Future<Result<AppFlowDestination>> completeOnboarding() async {
    try {
      await _localStorage.setBool(StorageKeys.onboardingCompleted, value: true);
      return const Success(AppFlowDestination.paywall);
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }

  @override
  Future<Result<AppFlowDestination>> completePaywall() async {
    try {
      await _localStorage.setBool(StorageKeys.paywallCompleted, value: true);
      return const Success(AppFlowDestination.home);
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }

  Future<AppFlowDestination> _resolveDestination() async {
    final onboardingCompleted =
        await _localStorage.getBool(StorageKeys.onboardingCompleted) ?? false;

    if (!onboardingCompleted) {
      return AppFlowDestination.onboarding;
    }

    final paywallCompleted =
        await _localStorage.getBool(StorageKeys.paywallCompleted) ?? false;

    if (!paywallCompleted) {
      return AppFlowDestination.paywall;
    }

    return AppFlowDestination.home;
  }
}
