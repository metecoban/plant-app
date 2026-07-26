import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/network/dio_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Talker get talker => TalkerFlutter.init();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(DioFactory factory) => factory.create();
}
