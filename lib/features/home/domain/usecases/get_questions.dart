import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

@injectable
class GetQuestions {
  const GetQuestions(this._repository);

  final HomeRepository _repository;

  Future<Result<List<Question>>> call() => _repository.getQuestions();
}
