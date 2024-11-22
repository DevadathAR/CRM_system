import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryBlueButton extends StatelessWidget {
  final String title;
  const PrimaryBlueButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Matches the width of other widgets
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.symmetric(vertical: 16), // Consistent padding
        ),
        child: title.text
            .textStyle(AppTextStyle.boldText(
              size: 16,
              color: AppColors.white,
            ))
            .make(),
      ),
    );
  }
}
