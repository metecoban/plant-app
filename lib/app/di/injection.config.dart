// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:plant_app/app/di/register_module.dart' as _i725;
import 'package:plant_app/app/router/app_router.dart' as _i631;
import 'package:plant_app/core/logger/app_bloc_observer.dart' as _i455;
import 'package:plant_app/core/logger/app_logger.dart' as _i477;
import 'package:plant_app/core/network/dio_client.dart' as _i747;
import 'package:plant_app/core/network/dio_factory.dart' as _i559;
import 'package:plant_app/core/storage/local_storage.dart' as _i933;
import 'package:plant_app/core/storage/shared_preferences_storage.dart'
    as _i801;
import 'package:plant_app/features/app_flow/data/repositories/app_flow_repository_impl.dart'
    as _i488;
import 'package:plant_app/features/app_flow/domain/repositories/app_flow_repository.dart'
    as _i489;
import 'package:plant_app/features/app_flow/presentation/cubit/app_flow_cubit.dart'
    as _i88;
import 'package:plant_app/features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i672;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i672.OnboardingCubit>(() => _i672.OnboardingCubit());
    gh.singleton<_i631.AppRouter>(() => _i631.AppRouter());
    gh.lazySingleton<_i207.Talker>(() => registerModule.talker);
    gh.lazySingleton<_i933.LocalStorage>(
      () => _i801.SharedPreferencesStorage(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i559.DioFactory>(() => _i559.DioFactory(gh<_i207.Talker>()));
    gh.lazySingleton<_i477.AppLogger>(
      () => _i477.AppLogger(gh<_i207.Talker>()),
    );
    gh.lazySingleton<_i455.AppBlocObserver>(
      () => _i455.AppBlocObserver(gh<_i207.Talker>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i559.DioFactory>()),
    );
    gh.lazySingleton<_i747.DioClient>(() => _i747.DioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i489.AppFlowRepository>(
      () => _i488.AppFlowRepositoryImpl(gh<_i933.LocalStorage>()),
    );
    gh.factory<_i88.AppFlowCubit>(
      () => _i88.AppFlowCubit(gh<_i489.AppFlowRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i725.RegisterModule {}
