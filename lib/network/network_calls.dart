import 'dart:convert';

import 'package:get/get.dart';
import 'package:halmstad/controllers/local_storage.dart';
import 'package:halmstad/network/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
    print(response.reasonPhrase);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getTodayInteractions() async {
    final token = await LocalStorage().getToken();
    final response =
        await http.get(Uri.parse('$baseUrl$getTodayInteractionsUrl'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getDateRangeInteractions(
      DateTime startDate, DateTime endDate) async {
    final token = await LocalStorage().getToken();
    final response = await http.get(
        Uri.parse(
            '$baseUrl$getDateRangeUrlInteractionsUrl?startDate=${DateFormat('yyyy-MM-dd').format(startDate)}&endDate=${DateFormat('yyyy-MM-dd').format(endDate)}'),

        // Uri.parse(
        //     '$baseUrl$getDateRangeUrlInteractionsUrl?startDate=2023-10-20&endDate=2024-05-27'),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      print(response.statusCode);
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
