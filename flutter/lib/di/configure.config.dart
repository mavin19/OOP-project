// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../service/api_service.dart' as _i7;
import '../service/share_pref_service.dart' as _i6;
import 'module/network_module.dart' as _i8;
import 'module/third_party_helper_register_module.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final thirdPartyHelperRegisterModule = _$ThirdPartyHelperRegisterModule();
  gh.factory<_i3.BaseOptions>(() => networkModule.getBaseOption());
  gh.factory<_i4.PrettyDioLogger>(() => networkModule.getLoggerInterceptor());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => thirdPartyHelperRegisterModule.getPreferenceInstance(),
    preResolve: true,
  );
  gh.factory<String>(() => networkModule.getApiBaseUrl());
  gh.factory<_i3.Dio>(() => networkModule.getDio(
        get<_i3.BaseOptions>(),
        get<_i4.PrettyDioLogger>(),
      ));
  gh.factory<_i6.SharePrefService>(
      () => _i6.SharePrefService(get<_i5.SharedPreferences>()));
  gh.factory<_i7.ApiService>(() => _i7.ApiService(
        get<_i3.Dio>(),
        baseUrl: get<String>(),
      ));
  return get;
}

class _$NetworkModule extends _i8.NetworkModule {}

class _$ThirdPartyHelperRegisterModule
    extends _i9.ThirdPartyHelperRegisterModule {}
