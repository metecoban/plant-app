import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/error/error_mapper.dart';
import 'package:plant_app/core/error/result.dart';

@lazySingleton
class DioClient {
  const DioClient(this._dio);

  final Dio _dio;

  Future<Result<Response<T>>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(response);
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }

  Future<Result<Response<T>>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(response);
    } on Exception catch (exception) {
      return FailureResult(ErrorMapper.mapException(exception));
    }
  }
}
