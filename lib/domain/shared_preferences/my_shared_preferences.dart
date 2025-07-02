import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences pref;
  static String keyName = 'name';
  static String emailKey = "email";
  static String phoneKey = "phone";
  static String keyLocation = 'location';

  static Future<void> initializeShared() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveSignUpData({required String username, required String email, required String phone}) async {
    try {
      pref = await SharedPreferences.getInstance();
      await pref.setString(keyName, username);
      await pref.setString(emailKey, email);
      await pref.setString(phoneKey, phone);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static String get getUserName => pref.getString("name") ?? "Anas";
  static String get getUserEmail => pref.getString("email") ?? "Anas@gmail.com";

  static String get getUserPhone => pref.getString("phone") ?? "0123456789";

  static Future<bool> saveProfileData(
      {required String name, required String email, required String phone, required String location, required String username}) async {
    try {
    await  pref.setString(keyName, name);
    await  pref.setString('email', email);
    await  pref.setString('username', username);
    await  pref.setString('phone', phone);

      pref.setString(keyLocation, location);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> logout() async {
    await pref.remove(keyName);
    await pref.remove(keyLocation);
    await pref.remove(phoneKey);
    await pref.remove(emailKey);
  }
}
