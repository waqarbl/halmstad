import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  void saveToken(String newToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', newToken);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
