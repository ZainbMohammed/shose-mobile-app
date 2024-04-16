import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIRequest {
  final String baseURL;

  APIRequest({required this.baseURL});

  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/$endpoint'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}