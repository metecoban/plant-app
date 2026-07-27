import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/network/api_endpoints.dart';
import 'package:plant_app/core/network/response_parser.dart';
import 'package:plant_app/features/home/data/models/category/categories_response_model.dart';
import 'package:plant_app/features/home/data/models/category/plant_model.dart';
import 'package:plant_app/features/home/data/models/question/question_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<QuestionModel>> getQuestions();

  Future<List<PlantModel>> getPlants();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.questions);
      final data = ResponseParser.asList(response.data);

      return data
          .map((item) => QuestionModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (exception) {
      throw _mapDioException(exception);
    } on FormatException catch (exception) {
      throw ParsingException(exception.message);
    } on TypeError catch (_) {
      throw const ParsingException('Failed to parse questions response.');
    }
  }

  @override
  Future<List<PlantModel>> getPlants() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.categories);
      final data = ResponseParser.asMap(response.data);

      return CategoriesResponseModel.fromJson(data).data;
    } on DioException catch (exception) {
      throw _mapDioException(exception);
    } on FormatException catch (exception) {
      throw ParsingException(exception.message);
    } on TypeError catch (_) {
      throw const ParsingException('Failed to parse categories response.');
    }
  }

  AppException _mapDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const TimeoutException(),
      DioExceptionType.connectionError => const NetworkException(),
      DioExceptionType.badResponse => ServerException(
        _serverMessage(exception.response?.statusCode),
      ),
      DioExceptionType.badCertificate ||
      DioExceptionType.cancel ||
      DioExceptionType.unknown => const UnknownException(),
    };
  }

  String _serverMessage(int? statusCode) {
    if (statusCode == null) {
      return 'Server error occurred.';
    }

    return 'Server error occurred. (HTTP $statusCode)';
  }
}
