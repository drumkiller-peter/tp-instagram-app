import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference() {
    init();
  }

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUserData({required String email, required String id}) async {
    await _prefs?.setString("email", email);
    await _prefs?.setString("user_id", id);
  }

  List<String?> getUserData() {
    return [_prefs?.getString("email"), _prefs?.getString("user_id")];
  }
}
