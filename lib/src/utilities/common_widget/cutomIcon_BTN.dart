import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustumIconButton extends StatelessWidget {
  final String buttonTItle;
  final IconData icon;
  const CustumIconButton({
    super.key,
    required this.buttonTItle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTItle,
            style: AppTextStyle.regularText(size: 16, color: AppColors.blue),
          ),
          10.widthBox,
          Icon(
            icon,
            size: 10,
            color: AppColors.blue,
          )
        ],
      ),
    );
  }
}
