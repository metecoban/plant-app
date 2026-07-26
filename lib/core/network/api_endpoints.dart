import 'package:plant_app/core/config/env.dart';

final class ApiEndpoints {
  const ApiEndpoints._();

  static const baseUrl = Env.apiBaseUrl;

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);

  static const defaultHeaders = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const questions = '/getQuestions';
  static const categories = '/getCategories';
}
