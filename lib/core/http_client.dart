import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpClient {
  final String baseUrl;

  HttpClient({required this.baseUrl});
  final Dio dio = Dio();

  FutureOr<dynamic> get() async {
    try {
      Response response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> post(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(baseUrl, data: data);

      if (response.statusCode == 201) {
        // Parse response data
        debugPrint('Post request successful: ${response.data.toString()}');
      } else {
        // Handle error
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network error
      debugPrint('Network error: $e');
    }
  }

  Future<dynamic> delete(int id) async {
    try {
      Response response = await dio.delete('$baseUrl/$id');

      if (response.statusCode == 200) {
        debugPrint('Delete request successful: Post with id $id deleted');
      } else {
        // Handle error
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network error
      debugPrint('Network error: $e');
    }
  }
}
