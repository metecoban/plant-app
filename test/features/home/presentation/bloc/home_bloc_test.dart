import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/usecases/get_plants.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/home/presentation/bloc/home_event.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';

import '../../../../helpers/home_fixtures.dart';

class _MockGetQuestions extends Mock implements GetQuestions {}

class _MockGetPlants extends Mock implements GetPlants {}

void main() {
  late _MockGetQuestions getQuestions;
  late _MockGetPlants getPlants;

  setUp(() {
    getQuestions = _MockGetQuestions();
    getPlants = _MockGetPlants();
  });

  HomeBloc buildBloc() => HomeBloc(getQuestions, getPlants);

  Future<List<HomeState>> collectStates(HomeBloc bloc, HomeEvent event) async {
    final states = <HomeState>[];
    final subscription = bloc.stream.listen(states.add);

    bloc.add(event);
    await Future<void>.delayed(Duration.zero);

    await subscription.cancel();
    await bloc.close();

    return states;
  }

  group('HomeBloc', () {
    test('started emits loading then success', () async {
      when(
        () => getQuestions(),
      ).thenAnswer((_) async => Success([sampleQuestion]));
      when(() => getPlants()).thenAnswer((_) async => Success([samplePlant]));

      final states = await collectStates(
        buildBloc(),
        const HomeEvent.started(),
      );

      expect(states, hasLength(2));
      expect(states.first, const HomeState.loading());
      expect(states.last, isA<HomeSuccess>());
      expect((states.last as HomeSuccess).questions, hasLength(1));
      expect((states.last as HomeSuccess).plants, hasLength(1));
    });

    test(
      'started emits loading then empty when both lists are empty',
      () async {
        when(
          () => getQuestions(),
        ).thenAnswer((_) async => const Success(<Question>[]));
        when(
          () => getPlants(),
        ).thenAnswer((_) async => const Success(<Plant>[]));

        final states = await collectStates(
          buildBloc(),
          const HomeEvent.started(),
        );

        expect(states, [const HomeState.loading(), const HomeState.empty()]);
      },
    );

    test('started emits loading then failure when questions fail', () async {
      when(() => getQuestions()).thenAnswer(
        (_) async => const FailureResult(
          Failure(type: FailureType.server, message: 'Server error'),
        ),
      );
      when(() => getPlants()).thenAnswer((_) async => Success([samplePlant]));

      final states = await collectStates(
        buildBloc(),
        const HomeEvent.started(),
      );

      expect(states, hasLength(2));
      expect(states.first, const HomeState.loading());
      expect(states.last, isA<HomeFailure>());
      expect((states.last as HomeFailure).failure.message, 'Server error');
    });

    test('retryRequested emits loading then success', () async {
      var questionCallCount = 0;
      when(() => getQuestions()).thenAnswer((_) async {
        questionCallCount++;
        if (questionCallCount == 1) {
          return const FailureResult(
            Failure(type: FailureType.network, message: 'Network error'),
          );
        }
        return Success([sampleQuestion]);
      });
      when(() => getPlants()).thenAnswer((_) async => Success([samplePlant]));

      final bloc = buildBloc()..add(const HomeEvent.started());
      await Future<void>.delayed(Duration.zero);

      final states = <HomeState>[];
      final subscription = bloc.stream.listen(states.add);

      bloc.add(const HomeEvent.retryRequested());
      await Future<void>.delayed(Duration.zero);

      await subscription.cancel();
      await bloc.close();

      expect(states, hasLength(2));
      expect(states.first, const HomeState.loading());
      expect(states.last, isA<HomeSuccess>());
    });
  });
}
