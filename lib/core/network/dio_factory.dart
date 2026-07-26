import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/network/api_endpoints.dart';
import 'package:plant_app/core/network/interceptors/network_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

@injectable
final class DioFactory {
  const DioFactory(this._talker);

  final Talker _talker;

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: ApiEndpoints.connectTimeout,
        receiveTimeout: ApiEndpoints.receiveTimeout,
        headers: ApiEndpoints.defaultHeaders,
      ),
    );

    dio.interceptors.addAll([
      NetworkLoggerInterceptor(
        TalkerDioLogger(
          talker: _talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      ),
    ]);

    return dio;
  }
}
