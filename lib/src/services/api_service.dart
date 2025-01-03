import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crm_system/src/features/employees/model/work.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  // static const String baseUrl = "http://192.168.29.49:8000";
  // static const String baseUrl = "http://127.0.0.1:8000";
  static const String baseUrl = "http://10.0.2.2:8000";

  // static const String baseUrl = "http://192.168.29.106:8000"; // ip

// AUthentication Api s
 Future<void> initializeToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    headers['Authorization'] = 'Bearer $token';
  }
  // Method to check if the user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return token != null && token.isNotEmpty;
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          // 'email': "c5@gmail.com",
          // 'password': '121212',
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
        //print(
        // 'Error during sign up. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}, Body: ${response.body}');
        throw Exception(
            'Failed to sign up. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Print and rethrow the error for further handling
      //print('An error occurred during signup: $error');
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
        headers: headers,
        body: jsonEncode({
          "typeOfCompany": typeOfCompany,
          "companyName": companyName,
          "totalStrength": totalStrength,
          "invitedMembers": invitedMembers,
        }),
      );

      if (response.statusCode == 200) {
        // print('onboarding Response :-$response.body');
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

  Future<Map<String, dynamic>> addProject({
    required String projectName,
    required DateTime startingDate,
    required DateTime deadline,
    required String priority,
    required String iconID,
    required String reporterId,
    required String projectDiscription,
    required List<String> projectLinks,
    required List<String> projectAssaignees,
    required List<File> projectAttachments, // For file uploads
  }) async {
    final url = Uri.parse('$baseUrl/addproject');

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);

      // Add form fields
      request.fields['projectName'] = projectName;
      request.fields['starts'] = startingDate.toIso8601String();
      request.fields['deadline'] = deadline.toIso8601String();
      request.fields['priority'] = priority;
      request.fields['iconId'] = iconID;
      request.fields['reporter'] = reporterId;
      request.fields['description'] = projectDiscription;

      // Add arrays for project links and assignees
      for (var link in projectLinks) {
        request.fields['projectlinks[]'] = link;
      }
      for (var assignee in projectAssaignees) {
        request.fields['projectassignees[]'] = assignee;
      }

      // Add file attachments
      for (var file in projectAttachments) {
        request.files.add(
          await http.MultipartFile.fromPath('projectattachment[]', file.path),
        );
      }

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to add project. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('An error occurred while adding the project: $e');
    }
  }

  Future<List<Map<String, dynamic>>> listUsers({
    required String email,
  }) async {
    final url = Uri.parse('$baseUrl/listusers');
    print(" API service is calling");
    print("$headers");
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        print('listUser Response :-${response.body}');
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['value'] == true && jsonResponse['message'] != null) {
          final List<dynamic> data = jsonResponse['message'];
          return data.map((user) => user as Map<String, dynamic>).toList();
        } else {
          throw Exception('Invalid API response structure.');
        }
      } else {
        throw Exception(
          'Failed to fetch users. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred while fetching the users: $e');
    }
  }

  // edit profile

  Future<Map<String, dynamic>> updateProfile({
    required String token,
    required String name,
    required String gender,
    required String position,
    required String experience,
    required String company,
    required String location,
    required String birthday,
    required String email,
    required String mobileNumber,
    required String skype,
  }) async {
    final url =
        Uri.parse('$baseUrl/editemployee'); // Replace with the actual endpoint

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'name': name,
          'gender': gender,
          'position': position,
          'experience': experience,
          'company': company,
          'location': location,
          'birthday': birthday,
          'email': email,
          'mobileNumber': mobileNumber,
          'skype': skype,
        }),
      );

      if (response.statusCode == 200) {
        //print(response);
        // log(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'Failed to update profile. Status code: ${response.statusCode}, reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred while updating the profile: $e');
    }
  }

  // fetchProfileDetails

  Future<Map<String, dynamic>> fetchProfileDetails() async {
    //print("______________________________________________$headers");

    final url = Uri.parse('$baseUrl/viewemployeeprofile');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({'userId': ''}), // Add userId if needed
      );

      if (response.statusCode == 200) {
        print("_________________________________________${response.body}");
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load profile details');
      }
    } catch (e) {
      throw Exception('An error occurred while feting profile details: $e');
    }
  }

static Future<EmployeeResponse> fetchEmployees({
    required int limit,
    required int page,
  }) async {
    final url = Uri.parse('$baseUrl/listemployeesbycompany');
    final body = jsonEncode({
      "limit": limit.toString(),
      "page": page.toString(),
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final int count = data['message']['company_employees_count'];
        if (data['value'] == true) {
          final List<EmployeeData> employees = (data['message']['company_employees'] as List)
              .map((e) => EmployeeData.fromJson(e))
              .toList();
          return EmployeeResponse(employees: employees, totalCount: count);
        } else {
          throw Exception('Failed to fetch employees: ${data['message']}');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }

}
