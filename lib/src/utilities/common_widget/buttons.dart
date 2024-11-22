import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Buttons extends StatelessWidget {
  final double? length;
  final Color? color;
  final String label;
  final bool back;
  final bool forward;

  final VoidCallback? ontap;
  
  final Color? textColor;

  const Buttons({
    super.key,
    this.length = 280,
    required this.label,
    this.color,
    this.textColor,
    required this.ontap,
    this.back = false,
    this.forward = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: length,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.textGrey1, blurRadius: 12, offset: const Offset(0, 6))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: color ?? AppColors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (back) SvgPicture.asset(arrowBackSvg),
            if (back) SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyle.boldText(size: 16, color:textColor),
            ),
            if (forward) SizedBox(width: 8),
           if(forward) SvgPicture.asset(arrowForwardSvg),
          ],
        ),
      ),
    );
  }
}

class RadioButtonRow extends StatefulWidget {
  final List<String> options; // List of radio button options
  final String? selectedValue; // The currently selected value
  final ValueChanged<String>? onChanged; // Callback when value changes

  const RadioButtonRow({
    Key? key,
    required this.options,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

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
      mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(
              width: 50,
            )
          ],
        );
      }).toList(),
    );
  }
}
