import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // 🔹 UPDATE BASE URL BASED ON YOUR ENVIRONMENT
  static const String baseUrl = "http://192.168.1.5:3000"; // Replace with your local/ngrok URL

  // 🔹 LOGIN FUNCTION
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/api/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Login Success: ${data['message']}");
        return data;
      } else {
        print("❌ Error ${response.statusCode}: ${response.body}");
        return {"error": "Login failed"};
      }
    } catch (e) {
      print("🚨 Exception: $e");
      return {"error": "Something went wrong"};
    }
  }
}
