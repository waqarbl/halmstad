import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkCalls {
  String baseUrl = 'http://192.168.18.103:3000/api/';

  String interactinonsUrl = 'todayInteractions';
  String meetingsUrl = '';
  String requestsUrl = '';
  String actionsUrl = '';

  Future<String> getInteractions() async {
    final response = await http.get(Uri.parse('$baseUrl$interactinonsUrl'));

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
    final response = await http.get(Uri.parse('$baseUrl$meetingsUrl'));

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
    final response = await http.get(Uri.parse('$baseUrl$requestsUrl'));

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
    final response = await http.get(Uri.parse('$baseUrl$actionsUrl'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('success');
      print(response.body);
      return response.body;
    } else {
      Get.rawSnackbar(message: response.reasonPhrase);
      return "Error: ${response.reasonPhrase}";
    }
  }
}
