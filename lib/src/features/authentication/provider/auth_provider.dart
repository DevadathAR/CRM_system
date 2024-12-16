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
  final TextEditingController typeOfCompanyController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController totalStrengthController = TextEditingController();
  final TextEditingController invitedMembersController =
      TextEditingController();
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
      final response = await AuthService().signUp(
        userType: userType.toString(),
        tagline: tagline,
        name: name,
        code: code,
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
      print('onboarding    :-$response');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Onboarding successful!')),
      );

      // Navigate to the success page
      context.goNamed(SuccessPage.route);
      companyIdController.dispose();
      companyNameController.dispose();
      businessDirController.dispose();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception: $error')),
      );
    }
  }

   @override
  void dispose() {
    // step 1 
    codeController.dispose();
    mobileController.dispose();
    otpController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // step 2 
    userTypeController.dispose();
    roleController.dispose();
    nameController.dispose();
    companyIdController.dispose();
    super.dispose();
  }
}



// // class AuthProvider extends ChangeNotifier {
// //   String? userType; // Shared state for user type
// //   String? role;     // Shared state for role
// //   String? name;     // Shared state for employee name
// //   String? company;  // Shared state for company selection

// //   bool get itsEmployee => role == 'Employee';

// //   void updateUserType(String? type) {
// //     userType = type;
// //     notifyListeners();
// //   }

// //   void updateRole(String? newRole) {
// //     role = newRole;
// //     notifyListeners();
// //   }

// //   void updateName(String? newName) {
// //     name = newName;
// //     notifyListeners();
// //   }

// //   void updateCompany(String? newCompany) {
// //     company = newCompany;
// //     notifyListeners();
// //   }

// //   void handleSignUp(BuildContext context) {
// //     // Consolidate and validate the collected data
// //     print("Signing up with userType: $userType, role: $role, name: $name, company: $company");
// //     // Proceed with sign-up logic
// //   }
// // }


// import 'dart:convert';

// import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
// import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
// import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
// import 'package:crm_system/src/services/api_service.dart';
// import 'package:crm_system/src/utilities/common_widget/text_field.dart';
// import 'package:crm_system/src/utilities/const.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthProvider extends ChangeNotifier {
//   // Shared state
//   bool isChecked = false;
//   String? _selectedMember;
//   String? get selectedMember => _selectedMember;

//   int _userType = 0; // Tracks user type (Work: 1, Business: 2)
//   int get userType => _userType;

//   List<String> memberCount = [
//     'Only me',
//     '2 - 5',
//     '6 - 10',
//     '11 - 20',
//     '21 - 40',
//     '41 - 50',
//     '51 - 100',
//     '101 - 500',
//     '500+'
//   ];

//   final List<Widget> _textFields = [
//     const TextInputField(hintText: 'Enter member email').py8(),
//   ];
//   List<Widget> get textFields => _textFields;

//   void addTextField() {
//     _textFields.add(const TextInputField(hintText: 'Enter member email').py8());
//     notifyListeners();
//   }

//   AuthProvider() {
//     // Additional listeners if needed
//   }

//   // Handle userType logic
//   void setUserType(String type) {
//     switch (type.trim()) {
//       case 'Work':
//         _userType = 1;
//         break;
//       case 'Business':
//         _userType = 2;
//         break;
//       default:
//         _userType = 0;
//         break;
//     }
//     notifyListeners();
//   }

//   // Handle checkbox state
//   void toggleCheckBox(bool? value) {
//     isChecked = value ?? false;
//     notifyListeners();
//   }

//   // Select member from dropdown
//   void selectMember(String member) {
//     _selectedMember = member;
//     notifyListeners();
//   }

//   // Handle sign-in logic
//   Future<void> handleSignIn(BuildContext context, String email, String password) async {
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Email and Password cannot be empty')),
//       );
//       return;
//     }

//     try {
//       final response = await AuthService().signIn(email.trim(), password.trim());

//       if (response['userType'] == 0) {
//         context.goNamed(DashBoard.route);
//       } else if (response['userType'] == 1 || response['userType'] == 2) {
//         context.goNamed(DashBoard.route);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response['message'] ?? 'Sign-in failed')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }

//   // Handle sign-up logic
//   Future<void> handleSignUp(
//     BuildContext context, {
//     required String name,
//     required String role,
//     required String mobile,
//     required String email,
//     required String password,
//     required String code,
//   }) async {
//     try {
//       final response = await AuthService().signUp(
//         userType: userType.toString(),
//         tagline: role,
//         name: name,
//         code: code,
//         mobile: mobile,
//         email: email,
//         password: password,
//       );

//       if (response['value'] == true) {
//         final token = response['token'];
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('auth_token', token);

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Sign-up successful!')),
//         );

//         if (userType == 1) {
//           context.goNamed(SuccessPage.route);
//         } else if (userType == 2) {
//           context.goNamed(SignUpStep3.route);
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response['message'] ?? 'Sign-up failed')),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $error')),
//       );
//     }
//   }

//   // Handle onboarding logic
//   Future<void> handleOnboarding(
//     BuildContext context, {
//     required String typeOfCompany,
//     required String companyName,
//     required String totalStrength,
//     required List<String> invitedMembers,
//   }) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('auth_token');

//       if (token == null || token.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Error: Token is missing.')),
//         );
//         return;
//       }

//       final response = await AuthService().onboarding(
//         token: token,
//         typeOfCompany: typeOfCompany,
//         companyName: companyName,
//         totalStrength: totalStrength,
//         invitedMembers: invitedMembers,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Onboarding successful!')),
//       );

//       context.goNamed(SuccessPage.route);
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Exception: $error')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     // No controllers to dispose here
//     super.dispose();
//   }
// }




