import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/usecases/get_plants.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions.dart';
import 'package:plant_app/features/home/presentation/bloc/home_event.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getQuestions, this._getPlants)
    : super(const HomeState.initial()) {
    on<HomeStarted>(_onStarted);
    on<HomeRefreshed>(_onRefreshed);
    on<HomeRetryRequested>(_onRetryRequested);
  }

  final GetQuestions _getQuestions;
  final GetPlants _getPlants;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    await _load(emit);
  }

  Future<void> _onRefreshed(
    HomeRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    final current = state;
    if (current case HomeSuccess(:final questions, :final plants)) {
      emit(
        HomeState.success(
          questions: questions,
          plants: plants,
          isRefreshing: true,
        ),
      );
    } else {
      emit(const HomeState.loading());
    }

    await _load(emit);
  }

  Future<void> _onRetryRequested(
    HomeRetryRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    await _load(emit);
  }

  Future<void> _load(Emitter<HomeState> emit) async {
    final results = await Future.wait([_getQuestions(), _getPlants()]);

    final questionsResult = results[0] as Result<List<Question>>;
    final plantsResult = results[1] as Result<List<Plant>>;

    final failure = _firstFailure(questionsResult, plantsResult);
    if (failure != null) {
      emit(HomeState.failure(failure: failure));
      return;
    }

    final questions = [...(questionsResult as Success<List<Question>>).data]
      ..sort((a, b) => a.order.compareTo(b.order));
    final plants = [...(plantsResult as Success<List<Plant>>).data]
      ..sort((a, b) => a.rank.compareTo(b.rank));

    if (questions.isEmpty && plants.isEmpty) {
      emit(const HomeState.empty());
      return;
    }

    emit(HomeState.success(questions: questions, plants: plants));
  }

  Failure? _firstFailure(
    Result<List<Question>> questionsResult,
    Result<List<Plant>> plantsResult,
  ) {
    return switch (questionsResult) {
      FailureResult(:final failure) => failure,
      Success() => switch (plantsResult) {
        FailureResult(:final failure) => failure,
        Success() => null,
      },
    };
  }
}
