import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/error_mapper.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<Question>>> getQuestions() async {
    try {
      final questions = await _remoteDataSource.getQuestions();

      return Success(questions.map((model) => model.toEntity()).toList());
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }

  @override
  Future<Result<List<Plant>>> getPlants() async {
    try {
      final plants = await _remoteDataSource.getPlants();

      return Success(plants.map((model) => model.toEntity()).toList());
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }
}
