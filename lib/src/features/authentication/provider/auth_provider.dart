import 'dart:convert';

import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // SignIn feild
  final TextEditingController signInemailController = TextEditingController();
  final TextEditingController singInpasswordController =
      TextEditingController();
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
  final TextEditingController firmNameController = TextEditingController();
  final TextEditingController businessDirController = TextEditingController();
  final TextEditingController memberSelectionController =
      TextEditingController();

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
    final mobile = codeController.text.trim() + mobileController.text.trim();
    // final otp = otpController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    // final Firmname = firmNameController.text.trim();
    final name = nameController.text.trim();
    final tagline = roleController.text.trim();

    if (name.isEmpty ||mobile.isEmpty || /*otp.isEmpty ||*/ email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      final response = await AuthService().signUp(
        userType: userType.toString(),
        tagline: tagline,
        name: name,
        mobile: mobile,
        email: email,
        password: password,
      );

      if (response['value'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-up successful!')),
        );

        // Navigate to another screen or update app state
        // Example:
        context.goNamed(SuccessPage.route);
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
