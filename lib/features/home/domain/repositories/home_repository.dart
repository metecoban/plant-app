import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';

abstract interface class HomeRepository {
  Future<Result<List<Question>>> getQuestions();

  Future<Result<List<Plant>>> getPlants();
}
