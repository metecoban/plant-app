sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error occurred.']);
}

final class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out.']);
}

final class ServerException extends AppException {
  const ServerException([super.message = 'Server error occurred.']);
}

final class ParsingException extends AppException {
  const ParsingException([super.message = 'Failed to parse response.']);
}

final class StorageException extends AppException {
  const StorageException([super.message = 'Storage operation failed.']);
}

final class UnknownException extends AppException {
  const UnknownException([super.message = 'An unknown error occurred.']);
}
