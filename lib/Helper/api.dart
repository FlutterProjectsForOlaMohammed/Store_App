import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getRequest({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a Problem With Status Code ${response.statusCode}");
    }
  }

  Future<dynamic> postRequest({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a Problem With Status Code ${response.statusCode}");
    }
  }

  Future<dynamic> putRequest({
    required String productID,
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.put(
      Uri.parse('$url/${int.parse(productID)}'),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a Problem With Status Code ${response.statusCode}");
    }
  }
}
