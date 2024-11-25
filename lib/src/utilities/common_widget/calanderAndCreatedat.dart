
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class CalenderAndCreatedat extends StatelessWidget {
  const CalenderAndCreatedat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(calendarGreySvg),
        10.widthBox,
        "Created May 28, 2020"
            .text
            .textStyle(AppTextStyle.semiboldText(
                size: 14, color: AppColors.textGrey1))
            .make(),
      ],
    );
  }
}
