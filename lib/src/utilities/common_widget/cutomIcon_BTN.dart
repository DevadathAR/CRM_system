import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class CustumIconButton extends StatelessWidget {
  final String buttonTItle;
  final String icon;
  final VoidCallback onTap;
  const CustumIconButton({
    super.key,
    required this.buttonTItle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      // onPressed: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTItle,
            style: AppTextStyle.regularText(size: 16, color: AppColors.blue),
          ),
          10.widthBox,
          SvgPicture.asset(
            icon,
            color: AppColors.blue,
          )
        ],
      ),
    ).onTap(onTap);
  }
}
