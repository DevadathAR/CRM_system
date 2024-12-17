import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectProvider extends ChangeNotifier {
  
  Future<void> handleAddProject(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null || token.isEmpty) {
        print('Error: Token is missing.');
        return;
      }

      final response = await AuthService().addProject(
      );
      print('Response: $response');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project Added Successfully!')),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
