import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class NetworkLoggerInterceptor extends Interceptor {
  NetworkLoggerInterceptor(this._talkerDioLogger);

  final TalkerDioLogger _talkerDioLogger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _talkerDioLogger.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _talkerDioLogger.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _talkerDioLogger.onError(err, handler);
  }
}
