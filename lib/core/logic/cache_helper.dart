import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimar_app/models/login.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static getToken() async {
    await _prefs.getString("token");
  }

  static Future saveLoginData(LoginModel user) async {
    await _prefs.setString("image", user.data.image);
    await _prefs.setInt("id", user.data.id);
    await _prefs.setString("phone", user.data.phone);
    await _prefs.setString("email", user.data.email);
    await _prefs.setString("fullname", user.data.fullname);
    await _prefs.setString("token", user.data.token);
    await _prefs.setString("cityId", user.data.city.id);
    await _prefs.setString("cityName", user.data.city.name);
    await _prefs.setBool("isActive", user.data.isActive);
    await _prefs.setInt("userCartCount", user.data.userCartCount);
    await _prefs.setInt("unreadNotifications", user.data.unreadNotifications);
  }

  static Future removeLoginData() async {
    await _prefs.remove("image");
    await _prefs.remove("id");
    await _prefs.remove("phone");
    await _prefs.remove("email");
    await _prefs.remove("fullname");
    await _prefs.remove("token");
    await _prefs.remove("cityId");
    await _prefs.remove("cityName");
    await _prefs.remove("isActive");
    await _prefs.remove("userCartCount");
    await _prefs.remove("unreadNotifications");
  }
}
