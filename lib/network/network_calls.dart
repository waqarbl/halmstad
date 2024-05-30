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
    final token = await LocalStorage().getToken();
    final response = await http.post(Uri.parse('$baseUrl$addInteractionUrl'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  //addAction

  addAction(var body) async {
    final token = await LocalStorage().getToken();
    final response = await http.post(Uri.parse('$baseUrl$actionsUrl'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  //getAction // get actions and check is before today--

  Future<String> getActions() async {
    final token = await LocalStorage().getToken();
    final response = await http.get(Uri.parse('$baseUrl$actionsUrl'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  //requests

  addRequest(var body) async {
    final token = await LocalStorage().getToken();
    final response = await http.post(Uri.parse('$baseUrl$requestsUrl'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getRequests() async {
    final token = await LocalStorage().getToken();
    final response =
        await http.get(Uri.parse('$baseUrl$requestsUrl'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  // meetings calls

  addMeeting(var body) async {
    final token = await LocalStorage().getToken();
    final response = await http.post(Uri.parse('$baseUrl$meetingsUrl'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  Future<String> getMeetings() async {
    final token = await LocalStorage().getToken();
    final response =
        await http.get(Uri.parse('$baseUrl$meetingsUrl'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }

  markAsResolved(String id) async {
    final token = await LocalStorage().getToken();
    final response = await http.post(Uri.parse('$baseUrl$resolveUrl'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"id": id}));

    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }
}
