import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyHelperRegisterModule {
  @preResolve
  Future<SharedPreferences> getPreferenceInstance() {
    return SharedPreferences.getInstance();
  }
}
