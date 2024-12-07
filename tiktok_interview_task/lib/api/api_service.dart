import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ApiResponse> getPostData(Map<String, dynamic> requestData) async {
    const String url = 'https://crickapi.com/post/v2/getPost';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'your_api_key_here',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        return ApiResponse(
          message: "Success",
          statusCode: response.statusCode,
          data: json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}

class ApiResponse {
  final String message;
  final int statusCode;
  final dynamic data;

  ApiResponse({
    required this.message,
    required this.statusCode,
    this.data,
  });
}
