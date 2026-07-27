import 'dart:convert';

import 'package:plant_app/core/error/app_exception.dart';

final class ResponseParser {
  const ResponseParser._();

  static List<dynamic> asList(Object? data) {
    final decoded = _decode(data);

    if (decoded is! List) {
      throw const ParsingException('Expected a JSON array response.');
    }

    return decoded;
  }

  static Map<String, dynamic> asMap(Object? data) {
    final decoded = _decode(data);

    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    if (decoded is Map) {
      return Map<String, dynamic>.from(decoded);
    }

    throw const ParsingException('Expected a JSON object response.');
  }

  static dynamic _decode(Object? data) {
    if (data == null) {
      throw const ParsingException('Response body was empty.');
    }

    if (data is String) {
      if (data.trim().isEmpty) {
        throw const ParsingException('Response body was empty.');
      }

      return jsonDecode(data);
    }

    return data;
  }
}
