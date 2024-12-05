import 'dart:ffi';

import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryBlueButton extends StatelessWidget {
  final bool isprefix;
  final bool isSuffix;
  final String prefixIcon;
  final String? suffixIcon;
  final Color? suffixColor;
  final Color? prefixColor;
  final Color? backGroundColor;
  final double elevation;
  final double? width;
  final String title;
  final Color? labelColor;
  final VoidCallback onPressed;
  const PrimaryBlueButton({
    super.key,
    required this.title,
    this.isprefix = false,
    this.prefixIcon = clocNakedkSvg,
    required this.onPressed,
    this.isSuffix = false,
    this.suffixIcon,
    this.suffixColor,
    this.prefixColor,
    this.elevation = 5.0,
    this.backGroundColor,
    this.labelColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Matches the width of other widgets
      child: ElevatedButton(
        iconAlignment: IconAlignment.end,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backGroundColor ?? AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding:
              const EdgeInsets.symmetric(vertical: 20), // Consistent padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isprefix)
              SvgPicture.asset(
                prefixIcon,
                colorFilter: ColorFilter.mode(
                    prefixColor ?? AppColors.white, BlendMode.srcIn),
              ),
            if (isprefix) 8.widthBox,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: title.text
                  .textStyle(AppTextStyle.boldText(
                    size: 16,
                    color: labelColor ?? AppColors.white,
                  ))
                  .make(),
            ),
            if (isSuffix) 8.widthBox,
            if (isSuffix)
              SvgPicture.asset(
                suffixIcon!,
                colorFilter: ColorFilter.mode(
                    suffixColor ?? AppColors.white, BlendMode.srcIn),
              ),
          ],
        ),
      ),
    );
  }
}
