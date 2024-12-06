import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';

class RadioButtonRow extends StatefulWidget {
  final List<String> options; // List of radio button options
  final String? selectedValue; // The currently selected value
  final ValueChanged<String>? onChanged; // Callback when value changes

  const RadioButtonRow({
    super.key,
    required this.options,
    this.selectedValue,
    this.onChanged,
  });

  @override
  _RadioButtonRowState createState() => _RadioButtonRowState();
}

class _RadioButtonRowState extends State<RadioButtonRow> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.options.map((option) {
        return Row(
          children: [
            Radio<String>(
              activeColor: AppColors.blue,
              value: option,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
                if (widget.onChanged != null && value != null) {
                  widget.onChanged!(value);
                }
              },
            ),
            Text(
              option,
              style: AppTextStyle.regularText(size: 14, color: AppColors.black),
            ),
          ],
        );
      }).toList(),
    );
  }
}
