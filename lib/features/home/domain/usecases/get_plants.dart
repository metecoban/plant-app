import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

@injectable
class GetPlants {
  const GetPlants(this._repository);

  final HomeRepository _repository;

  Future<Result<List<Plant>>> call() => _repository.getPlants();
}
