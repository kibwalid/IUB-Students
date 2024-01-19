import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<Map<String, dynamic>> postRequest(String url,
      Map<String, dynamic> body, Map<String, String> headers) async {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to perform POST request. Status code: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getRequest(
      String url, Map<String, String> headers) async {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to perform GET request. Status code: ${response.statusCode}');
    }
  }

  Future<String> getRequestWithoutDecode(
      String url, Map<String, String>? headers) async {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          'Failed to perform GET request. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> putRequest(String url, Map<String, dynamic> body,
      Map<String, String> headers) async {
    final response = await http.put(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to perform PUT request. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> deleteRequest(
      String url, Map<String, String> headers) async {
    final response = await http.delete(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to perform DELETE request. Status code: ${response.statusCode}');
    }
  }
}
