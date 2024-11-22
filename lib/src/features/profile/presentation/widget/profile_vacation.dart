import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileVacation extends StatelessWidget {
  final Color avatarColor;
  final String leaveType;
  final String status;
  final Color statusContainerColor;
  final String dateRange;
  final String duration;
  

  const ProfileVacation({
    super.key,
    required this.avatarColor,
    required this.leaveType,
    required this.status,
    required this.statusContainerColor,
    required this.dateRange,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: VStack([
        // Top Row
        HStack([
          VStack([
            "Request Type"
                .text
                .textStyle(AppTextStyle.regularText(size: 14, color: AppColors.textGrey1))
                .make(),
            HStack([
              VxCircle(radius: 10, backgroundColor: avatarColor),
              16.widthBox,
              leaveType
                  .text
                  .textStyle(AppTextStyle.boldText(size: 16, color: AppColors.black))
                  .make(),
            ]),
          ]).expand(),
          status
              .text
              .textStyle(AppTextStyle.boldText(size: 12, color: AppColors.white))
              .make()
              .box
              .withRounded(value: 10)
              .color(statusContainerColor)
              .height(30)
              .width(75)
              .alignCenter
              .make(),
        ]),
        16.heightBox,
        // Bottom Row
        HStack([
          SvgPicture.asset(calendarGreySvg),
          8.widthBox,
          dateRange
              .text
              .textStyle(AppTextStyle.semiboldText(size: 14, color: AppColors.textGrey1))
              .make(),
          Spacer(),
          duration
              .text
              .textStyle(AppTextStyle.boldText(size: 12, color: AppColors.textGrey1))
              .make()
              .box
              .withRounded(value: 10)
              .color(AppColors.backgroindGrey1)
              .height(30)
              .width(35)
              .alignCenter
              .make(),
        ]),
      ]),
    )
        .withRounded(value: 24)
        .color(AppColors.white)
        .p16
        .height(150)
        .make();
  }
}
