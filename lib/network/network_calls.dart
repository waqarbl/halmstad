import 'dart:convert';

import 'package:get/get.dart';
import 'package:halmstad/controllers/local_storage.dart';
import 'package:halmstad/network/api_urls.dart';
import 'package:http/http.dart' as http;

class NetworkCalls {
  Future<String> getEnums() async {
    final response = await http.get(Uri.parse('$baseUrl$getEnumsUrl'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getFocusAreas() async {
    final response = await http.get(Uri.parse('$baseUrl$getFocusAreasUrl'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getInteractions() async {
    final token = await LocalStorage().getToken();
    final response =
        await http.get(Uri.parse('$baseUrl$getTodayInteractionsUrl'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      print(response.body);
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getMeetings() async {
    final response = await http.get(Uri.parse('$baseUrl"meetingsUrl"'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      print(response.body);
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getRequests() async {
    final response = await http.get(Uri.parse('$baseUrl"requestsUrl"'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      print(response.body);
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getActions() async {
    final response = await http.get(Uri.parse('$baseUrl"actionsUrl"'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      print(response.body);
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> registerUser(var body) async {
    final response = await http.post(
        Uri.parse(
          '$baseUrl$registerUrl',
        ),
        body: jsonEncode(body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> loginUser(var body) async {
    final response = await http.post(
        Uri.parse(
          '$baseUrl$loginUrl',
        ),
        body: jsonEncode(body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  addInteraction(var body) async {
    final response = await http.post(Uri.parse('uri'), body: jsonEncode(body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }
}
