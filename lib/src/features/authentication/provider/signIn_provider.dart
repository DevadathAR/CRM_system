import 'dart:math';

import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  bool _isLoading = false;


  bool get isLoading => _isLoading;
  // SignIn feild
  final TextEditingController signInemailController = TextEditingController();
  final TextEditingController signInpasswordController =
      TextEditingController();
  bool isChecked = false;

  final ApiServices _apiService = ApiServices();
  String? token;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Save login status
  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
  }

  // Retrieve login status
  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Save user type
  Future<void> saveUserType(int userType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userType', userType);
  }

  // Retrieve user type
  Future<int?> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userType');
  }

  Future<void> handleSignIn(BuildContext context) async {
    setLoading(true);
    if (signInemailController.text.isEmpty ||
        signInpasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and Password cannot be empty')),
      );
      setLoading(false);

      return;
    }

    final email = signInemailController.text.trim();
    final password = signInpasswordController.text.trim();

    try {
      final response = await ApiServices().signIn(email, password);
      if (response.containsKey('userType')) {
        final userType = response['userType'];
        token = response['token'];

        await _apiService.saveToken(token!);

        await saveUserType(userType);
        await setLoginStatus(true);
        context.goNamed(DashBoard.route);
      }
      // log(jsonEncode(response));

      print(response);

      if (response['userType'] == 0) {
        context.goNamed(DashBoard.route);
      } else if (response['userType'] == 1) {
        context.goNamed(DashBoard.route);
      } else if (response['userType'] == 2) {
        context.goNamed(DashBoard.route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Sign in failed')),
        );
      }
    } catch (e) {
      //print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setLoading(false);
    }
  }

  // Check if the user is logged in
  Future<bool> checkLoginStatus() async {
    return await _apiService.isLoggedIn();
}


  void toggleCheckBox(bool? value) {
    isChecked = value ?? false;
    notifyListeners();
  }

// Clear login state on logout
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored preferences
    print("logOut Successfull");
    context.goNamed(SignIn.route); // Navigate back to login
  }

  @override
  void dispose() {
    signInemailController.dispose();
    signInpasswordController.dispose();
    super.dispose();
  }
}
