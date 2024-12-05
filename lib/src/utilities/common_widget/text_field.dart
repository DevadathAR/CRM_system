import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isDropDown;
  final bool viewIcon;
  final bool isSearch;
  final bool isPrefix;
  final bool isBorder;
  final int maxlines;
  final double height;
  final String? iconName;
  final String? viewprefix;
  final List<String>? dropDownOptions;
  final VoidCallback? ontap;
  const TextInputField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.viewIcon = false,
    this.keyboardType,
    this.iconName,
    this.onChanged,
    this.isDropDown = false,
    this.dropDownOptions,
    this.isSearch = false,
    this.isPrefix = false,
    this.isBorder = true,
    this.viewprefix,
    this.maxlines = 1,
    this.height = 50,
    this.ontap,
  });

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
    _selectedValue = widget.dropDownOptions?.first;
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
        height: widget.height,
        child: DropdownButtonFormField<String>(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textGrey1,
          ),
          decoration: InputDecoration(
            prefixIcon: widget.isPrefix
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.viewprefix.toString(),
                      colorFilter: ColorFilter.mode(
                          AppColors.textGrey1, BlendMode.srcIn),
                    ),
                  )
                : null,
            filled: true,
            fillColor: AppColors.white,
            labelText: widget.labelText,
            labelStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
            enabledBorder: widget.isBorder
                ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: AppColors.borderGrey),
                  )
                : InputBorder.none,
            focusedBorder: widget.isBorder
                ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: AppColors.borderGrey),
                  )
                : InputBorder.none,
            border: widget.isBorder
                ? OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: AppColors.borderGrey),
                  )
                : InputBorder.none,
          ),
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
                          size: 14, color: AppColors.textGrey1),
                    ),
                  ))
              .toList(),
        ),
      );
    } else {
      // Default TextFormField behavior
      return SizedBox(
        height: widget.height,
        child: TextFormField(
          maxLines: widget.maxlines,
          controller: widget.controller,
          obscureText: _isObscured,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            // enabledBorder: ,
            labelText: widget.labelText,
            labelStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
            hintText: widget.hintText,
            hintStyle:
                AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
            helperStyle:
                AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: AppColors.borderGrey),
            ),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: AppColors.borderGrey)),
            prefixIcon: widget.isSearch
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      searchIcon,
                      colorFilter: ColorFilter.mode(
                          AppColors.textGrey1, BlendMode.srcIn),
                    ),
                  )
                : null,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textGrey1,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : widget.viewIcon
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: widget.ontap,
                          child: SvgPicture.asset(
                            widget.iconName.toString(),
                            colorFilter: ColorFilter.mode(
                                AppColors.textGrey1, BlendMode.srcIn),
                          ),
                        ),
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
    super.key,
    required this.countryCodes,
    this.selectedCode,
    this.onCodeChanged,
  });

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
      height: 48,
      // width: size.width * 0.3,
      child: DropdownButtonFormField<String>(
        isDense: true,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textGrey1,
        ),
        value: _selectedCode,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0), // Adjust as needed

          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppColors.borderGrey),
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: AppColors.borderGrey)),
          labelStyle:
              AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
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
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText ?? "Enter phone number",
          hintStyle:
              AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppColors.borderGrey),
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: AppColors.borderGrey)),
        ),
      ),
    );
  }
}

class SMSCodeInput extends StatefulWidget {
  final ValueChanged<String>?
      onCodeEntered; // Callback when the complete code is entered

  const SMSCodeInput({super.key, this.onCodeEntered});

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
        return Flexible(
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style:
                AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
            decoration: InputDecoration(
              counterText: '', // Hides the character counter
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: AppColors.borderGrey),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: AppColors.borderGrey)),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                _nextField(index, value);
              } else {
                _previousField(index, value);
              }
            },
          ).pSymmetric(h: 4),
        );
      }),
    );
  }
}
