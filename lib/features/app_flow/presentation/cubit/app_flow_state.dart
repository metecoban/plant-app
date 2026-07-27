import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_status.dart';

class AppFlowState {
  const AppFlowState({this.status = AppFlowStatus.initial, this.failure});

  final AppFlowStatus status;
  final Failure? failure;

  AppFlowState copyWith({AppFlowStatus? status, Failure? failure}) {
    return AppFlowState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
