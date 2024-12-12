import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://127.0.0.1:8000";

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to sign in: ${response.body}");
      }
    } catch (e) {
      throw Exception('An error occurred while signing in: $e');
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String mobile,
    required String smsCode,
    required String email,
    required String password,
    required String userType,
    required String tagline,
    required String name,
    required String companyID,
  }) async {
    final url = Uri.parse('$baseUrl/signup');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'smsCode': smsCode,
        'email': email,
        'password': password,
        "phone": mobile,
        "userType": userType,
        "tagline": tagline,
        "name": name,
        "companyId": companyID
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to sign up. Status code: ${response.statusCode},  reason:-  ${response.reasonPhrase}',
      );
    }
  }
}
