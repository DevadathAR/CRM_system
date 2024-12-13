import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController taglineController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final TextEditingController companyIdController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  final TextEditingController firmNameController = TextEditingController();
  final TextEditingController businessDirController = TextEditingController();
  final TextEditingController memberSelectionController =
      TextEditingController();

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
    '101 - 500'
  ];

  AuthProvider() {
    // _loadUserData();
    roleController.addListener(() {
      notifyListeners();
    });
    userTypeController.addListener(() {
      notifyListeners();
    });
  }

  // Future<void> _loadSavedData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   firmNameController.text = prefs.getString('firmName') ?? '';
  //   businessDirController.text = prefs.getString('businessDir') ?? '';
  //   _selectedMember = prefs.getString('selectedMember');
  //   memberSelectionController.text = prefs.getString('memberSelection') ?? '';
  //   notifyListeners();
  // }

  // Future<void> saveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('firmName', firmNameController.text);
  //   await prefs.setString('businessDir', businessDirController.text);
  //   await prefs.setString('selectedMember', _selectedMember ?? '');
  //   await prefs.setString('memberSelection', memberSelectionController.text);
  // }

  void selectMember(String member) {
    _selectedMember = member;
    memberSelectionController.text = member;
    notifyListeners();
  }

  // Future<void> _saveUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('mobile', mobileController.text.trim());
  //   prefs.setString('otp', otpController.text.trim());
  //   prefs.setString('email', emailController.text.trim());
  //   prefs.setString('password', passwordController.text.trim());
  // }

  // Check if the company dropdown should be displayed

  // Computed property for userType

  Future<void> handleSignUp() async {
    final mobile = codeController.text.trim() + mobileController.text.trim();
    final otp = otpController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final tagline = roleController.text.trim();

    if (mobile.isEmpty || otp.isEmpty || email.isEmpty || password.isEmpty) {
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
         // Handle successful sign-up (e.g., navigate or update state)
      } else {
        debugPrint(response['value'] ?? 'Sign-up failed');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // Future<void> _loadUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   mobileController.text = prefs.getString('mobile') ?? '';
  //   otpController.text = prefs.getString('otp') ?? '';
  //   emailController.text = prefs.getString('email') ?? '';
  //   passwordController.text = prefs.getString('password') ?? '';
  // }

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    userTypeController.dispose();
    roleController.dispose();
    companyIdController.dispose();
    super.dispose();
  }
}
