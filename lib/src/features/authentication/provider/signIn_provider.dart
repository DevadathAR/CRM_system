import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  // SignIn feild
  final TextEditingController signInemailController = TextEditingController();
  final TextEditingController signInpasswordController =
      TextEditingController();
  bool isChecked = false;

  Future<void> handleSignIn(BuildContext context) async {
    if (signInemailController.text.isEmpty ||
        signInpasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and Password cannot be empty')),
      );
      return;
    }

    final email = signInemailController.text.trim();
    final password = signInpasswordController.text.trim();

    try {
      final response = await ApiServices().signIn(email, password);

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

  @override
  void dispose() {
    signInemailController.dispose();
    signInpasswordController.dispose();
    super.dispose();
  }
}
