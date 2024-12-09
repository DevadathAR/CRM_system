import 'package:flutter/material.dart';

class FormStateNotifier extends ChangeNotifier {

  // For CountryCodeField
  String _selectedCode = '';
  String get selectedCode => _selectedCode;

  set selectedCode(String code) {
    _selectedCode = code;
    notifyListeners();
  }

  // For PhoneNumberField
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  set phoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  // For SMSCodeInput
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String get code => controllers.map((controller) => controller.text).join();

  void onDigitChanged(ValueChanged<String>? onCodeEntered) {
    if (code.length == 4) {
      onCodeEntered?.call(code);
    }
  }

  void nextField(BuildContext context, int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    notifyListeners();
  }

  void previousField(BuildContext context, int index, String value) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    notifyListeners();
  }


  //......................
  // For TextInputField

  bool _isObscured = false;
  String? _selectedValue;

  bool get isObscured => _isObscured;
  String? get selectedValue => _selectedValue;

  void togglePasswordVisibility() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  void setSelectedValue(String? value) {
    _selectedValue = value;
    notifyListeners();
  }
}
