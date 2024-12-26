import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiServices {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static const String baseUrl = "http://10.0.2.2:8000";
  // static const String baseUrl = "http://192.168.29.49";
  // static const String baseUrl = "http://127.0.0.1:8000";

// AUthentication Api s

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: headers,

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
        print('onboarding Response :-$response.body');
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

  Future<List<Map<String, String>>> fetchAssignees({
    required String email,
    required String companyId,
  }) async {
    final url = Uri.parse('$baseUrl/listusers');
    final body = jsonEncode({"email": email, "companyId": companyId});
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) {
          return {
            "id": e['id'].toString(),
            "name": e['name'].toString(),
          };
        }).toList();
      } else {
        throw Exception(
          'Failed to fetch assignees: ${response.statusCode}, reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching assignees: $e');
    }
  }
  // Get requests..................................
}
