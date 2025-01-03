import 'dart:convert';

import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
// //signUp step 2

  // String? role; // Shared state for role

  // bool get itsEmployee => role == 'Employee';

  // SignUp feild
  final TextEditingController codeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final TextEditingController companyIdController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  //onboarding
  final TextEditingController typeOfCompanyController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController invitedMembersController =
      TextEditingController();
  final TextEditingController memberSelectionController =
      TextEditingController();

  int get userType {
    switch (userTypeController.text.trim()) {
      case 'Work':
        return 2;
      case 'Business':
        return 1;
      default:
        return 0;
    }
  }

  bool get itsEmployee => roleController.text == 'Employee';

// Onboarding controller ....

  String? _selectedMember;
  String? get selectedMember => _selectedMember;

  List<String> memberCount = [
    'Only me',
    '2 - 5',
    '6 - 10',
    '11 - 20',
    '21 - 40',
    '41 - 50',
    '51 - 100',
    '101 - 500',
    '500+'
  ];
// step4 onboarding
  final List<Widget> _textFields = [
    const TextInputField(hintText: memberMailHint).py8(),
  ];
  List<Widget> get textFields => _textFields;

  void addTextField() {
    _textFields.add(const TextInputField(hintText: memberMailHint).py8());
    notifyListeners();
  }

  AuthProvider() {
    // _loadUserData();
    roleController.addListener(() {
      notifyListeners();
    });
    userTypeController.addListener(() {
      notifyListeners();
    });
  }

  // SignIn

  void selectMember(String member) {
    _selectedMember = member;
    memberSelectionController.text = member;
    notifyListeners();
  }

  Future<void> handleSignUp(BuildContext context) async {
    final mobile = mobileController.text.trim();
    final code = codeController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final tagline = roleController.text.trim();

    try {
      final response = await ApiServices().signUp(
        userType: userType.toString(),
        tagline: tagline,
        name: name,
        code: code,
        mobile: mobile,
        email: email,
        password: password,
      );

      //print('Response from sign-up: $response');
      //print('UserType: $userType');

      if (response['value'] == true) {
        final token = response['token'];
        //print('Sign-up successful. Token: $token');

        // Save the token in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        if (userType == 1) {
          //print('Navigating to SuccessPage.');
          context.goNamed(SignUpStep3.route);
        } else if (userType == 2) {
          //print('Navigating to SignUpStep3.');
          context.goNamed(SuccessPage.route);
        }
      } else {
        final errorMessage = response['message'] ?? 'Sign-up failed.';
        //print('Sign-up failed. Message: $errorMessage');
      }
    } catch (error) {
      //print('Error occurred during sign-up: $error');
    }
  }

//onboarding APi
  Future<void> handleOnboarding(BuildContext context) async {
    final typeOfCompany = typeOfCompanyController.text.trim();
    final companyName = companyNameController.text.trim();
    final totalStrength = memberSelectionController.text.trim();

    // Split the invited members string into a list
    final invitedMembers = invitedMembersController.text
        .trim()
        .split(',')
        .map((email) => email.trim())
        .toList();

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null || token.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Token is missing.')),
        );
        return;
      }

      // Call the onboarding API via AuthService
      final response = await ApiServices().onboarding(
        token: token,
        typeOfCompany: typeOfCompany,
        companyName: companyName,
        totalStrength: totalStrength,
        invitedMembers: invitedMembers,
      );
      //print('onboarding    :-$response');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Onboarding successful!')),
      );

      // Navigate to the success page
      context.goNamed(SuccessPage.route);
      companyIdController.dispose();
      companyNameController.dispose();
      typeOfCompanyController.dispose();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception: $error')),
      );
    }
  }

  // @override
  // void dispose() {
  //   // step 1
  //   codeController.dispose();
  //   mobileController.dispose();
  //   otpController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   // step 2
  //   userTypeController.dispose();
  //   roleController.dispose();
  //   nameController.dispose();
  //   companyIdController.dispose();
  //   super.dispose();
  // }
}
