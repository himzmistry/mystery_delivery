import 'package:shared_preferences/shared_preferences.dart';
import 'sp_keys.dart';

class SpManager {
  static SpManager? spManager;
  static SharedPreferences? _preferences;

  static Future<SpManager?> getInstance() async {
    if (spManager == null) {
      var secureStorage = SpManager._();
      await secureStorage._init();
      spManager = secureStorage;
    }
    return spManager;
  }

  SpManager._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  static int getInt(String key, int defValue) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  static Future<bool>? putInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  static bool getBool(String key, bool defValue) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  static bool isLogin({bool defValue = false}) {
    if (_preferences == null) return false;
    return _preferences!.getBool(SpKeys.isLogin) ?? false;
  }

  static Future<bool>? setIsLogin(bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(SpKeys.isLogin, value);
  }

  static removeItem(key) {
    _preferences!.remove(key);
  }

  static clearSharedPreferences() async {
    _preferences!.clear();
  }

  static Future deleteUser() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  }
}
