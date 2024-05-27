import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<void> saveToken(String newToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', newToken);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> writeJsonToFile(Map<String, dynamic> data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file =
        File('${directory.path}/myenums.json'); // Replace with desired filename

    final jsonData = json.encode(data);
    await file.writeAsString(jsonData);
  }

  Future<Map<String, dynamic>> readJsonFromFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/myenums.json'); // Same filename

    try {
      final jsonData = await file.readAsString();
      final data = json.decode(jsonData) as Map<String, dynamic>;
      return data;
    } on FileSystemException {
      // Handle the case where the file doesn't exist or can't be read
      return <String, dynamic>{}; // Return an empty map if file not found
    } catch (e) {
      // Handle other errors (e.g., parsing issues)
      rethrow;
    }
  }
}
