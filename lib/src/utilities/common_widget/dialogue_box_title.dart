import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class DialogueBoxTitle extends StatelessWidget {
  final String title;
  const DialogueBoxTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.text.textStyle(AppTextStyle.boldText(size: 22)).make(),
        SvgPicture.asset(
          closeIconSvg,
          colorFilter: ColorFilter.mode(AppColors.lightblack, BlendMode.srcIn),
          height: 18,
          width: 18,
        ).onTap(() => Navigator.pop(context)), // Close button
      ],
    );
  }
}
