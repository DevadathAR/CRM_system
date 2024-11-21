import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isDropDown;
  final List<String>? dropDownOptions;
  const TextInputField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.isDropDown = false,
    this.dropDownOptions,
  }) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late bool _isObscured;
  late String? _selectedValue; // For dropdown selection

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
    _selectedValue =
        widget.dropDownOptions?.first; // Set default value for dropdown
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDropDown) {
      // Show dropdown when isDropDown is true
      return SizedBox(
        height: 50,
        child: DropdownButtonFormField<String>(
          value: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            if (widget.onChanged != null && value != null) {
              widget.onChanged!(value);
            }
          },
          items: widget.dropDownOptions
              ?.map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                      style: AppTextStyle.mediumText(
                          size: 14, color: AppColors.black),
                    ),
                  ))
              .toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            labelText: widget.labelText,
            labelStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
        ),
      );
    } else {
      // Default TextFormField behavior
      return SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.grey),
            hintText: widget.hintText,
            helperStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null,
          ),
        ),
      );
    }
  }
}

class CountryCodeField extends StatefulWidget {
  final List<String> countryCodes; // List of country codes
  final String? selectedCode; // Currently selected code
  final ValueChanged<String>? onCodeChanged;

  const CountryCodeField({
    Key? key,
    required this.countryCodes,
    this.selectedCode,
    this.onCodeChanged,
  }) : super(key: key);

  @override
  _CountryCodeFieldState createState() => _CountryCodeFieldState();
}

class _CountryCodeFieldState extends State<CountryCodeField> {
  late String _selectedCode;

  @override
  void initState() {
    super.initState();
    _selectedCode = widget.selectedCode ?? widget.countryCodes.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 83,
      child: DropdownButtonFormField<String>(
        value: _selectedCode,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          labelStyle: AppTextStyle.mediumText(size: 14, color: AppColors.grey),
        ),
        items: widget.countryCodes.map((code) {
          return DropdownMenuItem<String>(
            value: code,
            child: Text(
              code,
              style: AppTextStyle.mediumText(size: 14, color: AppColors.black),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedCode = value;
            });
            if (widget.onCodeChanged != null) {
              widget.onCodeChanged!(value);
            }
          }
        },
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const PhoneNumberField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 230,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText ?? "Enter phone number",
          hintStyle: AppTextStyle.mediumText(size: 14, color: AppColors.grey),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
    );
  }
}

class SMSCodeInput extends StatefulWidget {
  final ValueChanged<String>?
      onCodeEntered; // Callback when the complete code is entered

  const SMSCodeInput({Key? key, this.onCodeEntered}) : super(key: key);

  @override
  _SMSCodeInputState createState() => _SMSCodeInputState();
}

class _SMSCodeInputState extends State<SMSCodeInput> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged() {
    final code = _controllers.map((controller) => controller.text).join();
    if (code.length == 4) {
      widget.onCodeEntered?.call(code);
    }
  }

  void _nextField(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    _onDigitChanged();
  }

  void _previousField(int index, String value) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          width: 60,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: AppTextStyle.regularText(size: 14, color: AppColors.grey),
            decoration: InputDecoration(
              counterText: '', // Hides the character counter
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                _nextField(index, value);
              } else {
                _previousField(index, value);
              }
            },
          ),
        );
      }),
    );
  }
}
