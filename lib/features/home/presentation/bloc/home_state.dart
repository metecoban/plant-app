import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.success({
    required List<Question> questions,
    required List<Plant> plants,
    @Default(false) bool isRefreshing,
  }) = HomeSuccess;

  const factory HomeState.empty() = HomeEmpty;

  const factory HomeState.failure({required Failure failure}) = HomeFailure;
}
