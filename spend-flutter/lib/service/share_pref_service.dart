import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
@lazySingleton
class SharePrefService {
  static const STRAPI_ACCESS_TOKEN = 'STRAPI_ACCESS_TOKEN';
  static const ID = "ID";
  static const USERNAME = "USERNAME";
  static const EMAIL = "EMAIL";

  final SharedPreferences _instance;

  // @factoryMethod
  SharePrefService(this._instance);

  SharedPreferences getInstance() {
    return _instance;
  }

  void logout() {
    /// Make sure to remove item that should not persist when user logout
    _instance.remove(ID);
  }

  Future<void> setId(String id) async {
    await _instance.setString(ID, id);
  }

  String getId() {
    return _instance.getString(ID) ?? '';
  }

  Future<void> setUsername(String name) async {
    await _instance.setString(USERNAME, name);
  }

  String getUsername() {
    return _instance.getString(USERNAME) ?? '';
  }

  Future<void> setEmail(String email) async {
    await _instance.setString(EMAIL, email);
  }

  String getEmail() {
    return _instance.getString(EMAIL) ?? '';
  }
}
