import 'dart:convert';

import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  // SignIn feild
  final TextEditingController signInemailController = TextEditingController();
  final TextEditingController singInpasswordController =TextEditingController();
  bool isChecked = false;

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
  final TextEditingController typeOfCompanyController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController totalStrengthController = TextEditingController();
  final TextEditingController invitedMembersController = TextEditingController();
  final TextEditingController firmNameController = TextEditingController();
  final TextEditingController businessDirController = TextEditingController();
  final TextEditingController memberSelectionController =TextEditingController();
  int get userType {
    switch (userTypeController.text.trim()) {
      case 'Work':
        return 1;
      case 'Business':
        return 2;
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
  Future<void> handleSignIn(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and Password cannot be empty')),
      );
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final response = await AuthService().signIn(email, password);

      // log(jsonEncode(response));

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  void toggleCheckBox(bool? value) {
    isChecked = value ?? false;
    notifyListeners();
  }

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
      final response = await AuthService().signUp(
        userType: userType.toString(),
        tagline: tagline,
        name: name,
        code : code,
        mobile: mobile,
        email: email,
        password: password,
      );
      print(response);
      print('userType :- $userType');

      if (response['value'] == true) {
        final token = response['token'];
        // Save the token in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-up successful!')),
        );
        if (userType == 1) {
          context.goNamed(SuccessPage.route);
        } else if (userType == 2) {
          //onbording
          context.goNamed(SignUpStep3.route);
        }
        // Navigate to another screen or update app state
        // Example:
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Sign-up failed')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

//onboarding APi
  Future<void> handleOnboarding(BuildContext context) async {
    final typeOfCompany = typeOfCompanyController.text.trim();
    final companyName = companyNameController.text.trim();
    final totalStrength = totalStrengthController.text.trim();

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
      final response = await AuthService().onboarding(
        token: token,
        typeOfCompany: typeOfCompany,
        companyName: companyName,
        totalStrength: totalStrength,
        invitedMembers: invitedMembers,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Onboarding successful!')),
      );

      // Navigate to the success page
      context.goNamed(SuccessPage.route);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception: $error')),
      );
    }
  }

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    emailController.dispose();
    passwordController.dispose();
    firmNameController.dispose();
    userTypeController.dispose();
    roleController.dispose();
    companyIdController.dispose();
    super.dispose();
  }
}
