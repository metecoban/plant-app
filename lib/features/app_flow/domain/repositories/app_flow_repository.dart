import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/app_flow/domain/entities/app_flow_destination.dart';

abstract interface class AppFlowRepository {
  Future<Result<AppFlowDestination>> getDestination();

  Future<Result<AppFlowDestination>> completeOnboarding();

  Future<Result<AppFlowDestination>> completePaywall();
}
