// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  final String path;
  final Map<String, dynamic> queryParams;
  final String errorMessage;

  NetworkHelper(
      {required this.url,
      required this.path,
      required this.queryParams,
      required this.errorMessage});

  Future<dynamic> getData() async {
    try {
      final response = await http.get(Uri.https(url, path, queryParams));

      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        throw Exception('$errorMessage: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
