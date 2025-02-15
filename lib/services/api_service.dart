import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_config.dart';

class ApiService {
  static Future<String> registerUser(String name, String email, String password) async {
    try {
      final url = Uri.parse("$baseUrl/api/users/register");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "email": email, "password": password}),
      );

      final responseData = jsonDecode(response.body);
      return response.statusCode == 201 ? "✅ Registration successful!" : "❌ ${responseData['error']}";
    } catch (e) {
      return "⚠️ Failed to connect to server.";
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final url = Uri.parse("$baseUrl/api/users/login");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      return response.statusCode == 200 ? jsonDecode(response.body) : {"error": "Invalid login credentials"};
    } catch (e) {
      return {"error": "⚠️ Failed to connect to server. Check API URL."};
    }
  }
}
