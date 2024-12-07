import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIDefaults {
  static Map<String, String> defaultHeaders() => {
    HttpHeaders.contentTypeHeader: 'application/json',
    "Authorization": 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODEzMTE3Mzh9.nCbgjRKXmvomiaxlKNX7uYbf1Y1tbDcRnTg2e2gZrvM',
  };

  static String showApiStatusMessage(http.Response response, [String? message]) {
    try {
      Map<String, dynamic> map = jsonDecode(response.body);
      String messageString = message ?? '';

      switch (response.statusCode) {
        case 200:
          messageString = map['message'] ?? "Success.";
          break;
        case 400:
          messageString = map['message'] ?? "Bad Request.";
          break;
        case 401:
          messageString = map['message'] ?? "Unauthorized access.";
          break;
        case 404:
          messageString = map['message'] ?? "Not Found.";
          break;
        case 500:
          messageString = map['message'] ?? "Internal Server Error.";
          break;
        default:
          messageString = map['message'] ?? "An unexpected error occurred.";
      }

      return messageString;
    } catch (e) {
      return "Something went wrong!";
    }
  }
}
