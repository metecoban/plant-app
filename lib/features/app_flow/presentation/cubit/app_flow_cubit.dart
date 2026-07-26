import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/app_flow/domain/entities/app_flow_destination.dart';
import 'package:plant_app/features/app_flow/domain/repositories/app_flow_repository.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_state.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_status.dart';

@injectable
class AppFlowCubit extends Cubit<AppFlowState> {
  AppFlowCubit(this._repository) : super(const AppFlowState());

  final AppFlowRepository _repository;

  Future<void> loadFlow() async {
    emit(state.copyWith(status: AppFlowStatus.loading));
    await _handleDestinationResult(_repository.getDestination());
  }

  Future<void> completeOnboarding() async {
    emit(state.copyWith(status: AppFlowStatus.loading));
    await _handleDestinationResult(_repository.completeOnboarding());
  }

  Future<void> completePaywall() async {
    emit(state.copyWith(status: AppFlowStatus.loading));
    await _handleDestinationResult(_repository.completePaywall());
  }

  Future<void> _handleDestinationResult(
    Future<Result<AppFlowDestination>> resultFuture,
  ) async {
    final result = await resultFuture;

    switch (result) {
      case Success(:final data):
        emit(
          state.copyWith(
            status: _statusFromDestination(data),
          ),
        );
      case FailureResult(:final failure):
        emit(
          state.copyWith(
            status: AppFlowStatus.failure,
            failure: failure,
          ),
        );
    }
  }

  AppFlowStatus _statusFromDestination(AppFlowDestination destination) {
    return switch (destination) {
      AppFlowDestination.onboarding => AppFlowStatus.onboardingRequired,
      AppFlowDestination.paywall => AppFlowStatus.paywallRequired,
      AppFlowDestination.home => AppFlowStatus.home,
    };
  }
}
