enum FailureType {
  network,
  timeout,
  server,
  parsing,
  storage,
  unknown,
}

final class Failure {
  const Failure({
    required this.type,
    required this.message,
  });

  final FailureType type;
  final String message;
}
