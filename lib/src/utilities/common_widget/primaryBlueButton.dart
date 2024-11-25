import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryBlueButton extends StatelessWidget {
  final bool isprefix;
  final String icon;
  final String title;
  const PrimaryBlueButton({
    super.key,
    required this.title,
    this.isprefix = false,
    this.icon = clocNakedkSvg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Matches the width of other widgets
      child: ElevatedButton(
        iconAlignment: IconAlignment.end,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isprefix)
              SvgPicture.asset(
                clocNakedkSvg,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            if (isprefix) 8.widthBox,
            title.text
                .textStyle(AppTextStyle.boldText(
                  size: 16,
                  color: AppColors.white,
                ))
                .make(),
          ],
        ),
      ),
    );
  }
}
