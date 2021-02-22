import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

@provide
class InitPrefsHelper {

  Future<void> setUsername(String username) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.setString('username', username);
  }

  Future<String> getUsername() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('username');
  }


  Future<void> clearPrefs() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.clear();
  }

}
