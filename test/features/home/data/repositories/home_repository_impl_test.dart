import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/error/failure.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';

import '../../../../helpers/home_fixtures.dart';

class _MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late _MockHomeRemoteDataSource dataSource;
  late HomeRepositoryImpl repository;

  setUp(() {
    dataSource = _MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(dataSource);
  });

  group('getQuestions', () {
    test('returns entity list on successful response', () async {
      when(
        () => dataSource.getQuestions(),
      ).thenAnswer((_) async => [sampleQuestionModel, sampleQuestionModelTwo]);

      final result = await repository.getQuestions();

      expect(result, isA<Success<List<Question>>>());
      final questions = (result as Success<List<Question>>).data;
      expect(questions, hasLength(2));
      expect(questions.first.title, 'How to identify plants?');
    });

    test('returns server failure on server exception', () async {
      when(
        () => dataSource.getQuestions(),
      ).thenThrow(const ServerException('Server unavailable'));

      final result = await repository.getQuestions();

      expect(result, isA<FailureResult<List<Question>>>());
      final failure = (result as FailureResult<List<Question>>).failure;
      expect(failure.type, FailureType.server);
      expect(failure.message, 'Server unavailable');
    });

    test('returns parsing failure on parsing exception', () async {
      when(
        () => dataSource.getQuestions(),
      ).thenThrow(const ParsingException('Invalid JSON'));

      final result = await repository.getQuestions();

      expect(result, isA<FailureResult<List<Question>>>());
      expect(
        (result as FailureResult<List<Question>>).failure.type,
        FailureType.parsing,
      );
    });

    test('returns empty list on empty response', () async {
      when(() => dataSource.getQuestions()).thenAnswer((_) async => []);

      final result = await repository.getQuestions();

      expect(result, isA<Success<List<Question>>>());
      expect((result as Success<List<Question>>).data, isEmpty);
    });
  });

  group('getPlants', () {
    test('returns entity list on successful response', () async {
      when(
        () => dataSource.getPlants(),
      ).thenAnswer((_) async => [samplePlantModel, samplePlantModelTwo]);

      final result = await repository.getPlants();

      expect(result, isA<Success<List<Plant>>>());
      final plants = (result as Success<List<Plant>>).data;
      expect(plants, hasLength(2));
      expect(plants.first.title, 'Edible Plants');
    });

    test('returns network failure on network exception', () async {
      when(
        () => dataSource.getPlants(),
      ).thenThrow(const NetworkException('No connection'));

      final result = await repository.getPlants();

      expect(result, isA<FailureResult<List<Plant>>>());
      expect(
        (result as FailureResult<List<Plant>>).failure.type,
        FailureType.network,
      );
    });

    test('returns empty list on empty response', () async {
      when(() => dataSource.getPlants()).thenAnswer((_) async => []);

      final result = await repository.getPlants();

      expect(result, isA<Success<List<Plant>>>());
      expect((result as Success<List<Plant>>).data, isEmpty);
    });
  });
}
