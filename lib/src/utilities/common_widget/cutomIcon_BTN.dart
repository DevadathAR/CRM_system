import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class CustumIconButton extends StatelessWidget {
  final String buttonTItle;
  final String icon;
  final bool isPrefix;
  final VoidCallback onTap;
  const CustumIconButton({
    super.key,
    required this.buttonTItle,
    required this.icon,
    required this.onTap,
    this.isPrefix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.yellow,
      padding: const EdgeInsets.symmetric(vertical: 5),
      // onPressed: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPrefix)
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
            ),
          10.widthBox,
          Text(
            buttonTItle,
            style: AppTextStyle.semiboldText(size: 16, color: AppColors.blue),
          ),
          10.widthBox,
          if (!isPrefix)
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
            )
        ],
      ),
    ).onTap(onTap);
  }
}
