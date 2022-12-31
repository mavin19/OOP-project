
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
@lazySingleton
class SharePrefService {
  static const STRAPI_ACCESS_TOKEN = 'STRAPI_ACCESS_TOKEN';

  final SharedPreferences _instance;

  SharePrefService(this._instance);

  SharedPreferences getInstance() {
    return _instance;
  }
}