import 'package:dio/dio.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/error/failure.dart';

final class ErrorMapper {
  const ErrorMapper._();

  static Failure mapException(Object exception) {
    if (exception is DioException) {
      return mapDioException(exception);
    }

    if (exception is AppException) {
      return mapAppException(exception);
    }

    return const Failure(
      type: FailureType.unknown,
      message: 'An unknown error occurred.',
    );
  }

  static Failure mapDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const Failure(
        type: FailureType.timeout,
        message: 'Request timed out.',
      ),
      DioExceptionType.connectionError => const Failure(
        type: FailureType.network,
        message: 'Network error occurred.',
      ),
      DioExceptionType.badResponse => Failure(
        type: FailureType.server,
        message: _serverMessage(exception.response?.statusCode),
      ),
      DioExceptionType.badCertificate ||
      DioExceptionType.cancel ||
      DioExceptionType.unknown => const Failure(
        type: FailureType.unknown,
        message: 'Request could not be completed.',
      ),
    };
  }

  static Failure mapAppException(AppException exception) {
    final type = switch (exception) {
      NetworkException() => FailureType.network,
      TimeoutException() => FailureType.timeout,
      ServerException() => FailureType.server,
      ParsingException() => FailureType.parsing,
      StorageException() => FailureType.storage,
      UnknownException() => FailureType.unknown,
    };

    return Failure(type: type, message: exception.message);
  }

  static String _serverMessage(int? statusCode) {
    if (statusCode == null) {
      return 'Server error occurred.';
    }

    return 'Server error occurred. (HTTP $statusCode)';
  }
}
