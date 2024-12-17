import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static const String baseUrl = "http://10.0.2.2:8000";
  // static const String baseUrl = "http://127.0.0.1:8000";

// AUthentication Api s

//..........................................................................
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: headers,
        // headers: {
        //   'Content-Type': 'application/json',
        // },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var token = data['token'];
        headers['Authorization'] = 'Bearer $token';
        return data;
      } else {
        throw Exception("Failed to sign in: ${response.body}");
      }
    } catch (e) {
      throw Exception('An error occurred while signing in: $e');
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String mobile,
    required String email,
    required String password,
    required String userType,
    required String code,
    required String tagline,
    required String name,
  }) async {
    final url = Uri.parse('$baseUrl/signup');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          "phone": "$code $mobile",
          "userType": userType,
          "tagline": tagline,
          "name": name,
          "companyId": ""
        }),
      );

      if (response.statusCode == 200) {
         var data = jsonDecode(response.body);
        var token = data['token'];
        headers['Authorization'] = 'Bearer $token';
        return data;
      } else {
        // Log detailed error information
        print(
            'Error during sign up. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}, Body: ${response.body}');
        throw Exception(
            'Failed to sign up. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Print and rethrow the error for further handling
      print('An error occurred during signup: $error');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> onboarding({
    required String token,
    required String typeOfCompany,
    required String companyName,
    required String totalStrength,
    required List<String> invitedMembers,
  }) async {
    final url = Uri.parse('$baseUrl/onboarding');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "typeOfCompany": typeOfCompany,
          "companyName": companyName,
          "totalStrength": totalStrength,
          "invitedMembers": invitedMembers,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'Failed to onboard. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred during onboarding: $e');
    }
  }

  //..........................................................................

  Future<Map<String, dynamic>> addProject() async {
    final url =
        Uri.parse('$baseUrl/addproject'); // Corrected double slash issue

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'projectName': 'newproject',
          'starts': '2024-12-21',
          'deadline': '2025-02-23',
          'priority': '2',
          'iconId': '1',
          'reporter': '5',
          'projectlinks': ['https://new.com', 'https://new.com'],
          'projectassignees': ['4', '6'],
          'description': 'our new project',
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'Failed to add project. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred while adding the project: $e');
    }
  }
}
