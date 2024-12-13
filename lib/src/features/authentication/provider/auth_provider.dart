import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final TextEditingController companyIdController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
    '101 - 500',
    '500+'
  ];
// step4
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
    firmNameController.dispose();
    userTypeController.dispose();
    roleController.dispose();
    companyIdController.dispose();
    super.dispose();
  }
}
