import 'package:shared_preferences/shared_preferences.dart';

class SharedAuth {
  static  late SharedPreferences _sharedPreferences;
  static String loggedKey = "loggedKey";
  static late bool response;
  static Future<void> saveLoginStatus() async {
    _sharedPreferences.setBool(loggedKey, true );
  }

  static Future<void> initShared() async {
    _sharedPreferences  = await SharedPreferences.getInstance();
  }

  static Future<void> currentStatus() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    response = _sharedPreferences.getBool(loggedKey) ?? false;
  }

  static Future<void> userLogout() async {
    await initShared();
    await _sharedPreferences.setBool(loggedKey, false);
    await _sharedPreferences.clear();
  }

  static bool get getCurrentStatus => response;
}
