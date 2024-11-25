import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationPage extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();

  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: VStack(
        [
          // Title Row with VelocityX
          HStack(
            [
              "Notifications"
                  .text
                  .textStyle(AppTextStyle.boldText(size: 18))
                  .make(),
              Spacer(),
              SvgPicture.asset(
                closeIconSvg,
                height: 24,
                width: 24,
              ).onTap(() => Navigator.pop(context)), // Close button
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
          24.heightBox,
          _notificationCard(),
        ],
        // crossAxisAlignment: CrossAxisAlignment.start,
        alignment: MainAxisAlignment.start,
        axisSize: MainAxisSize.min,
      ).box.withRounded(value: 24).p16.color(AppColors.white).shadowMd.make(),
    );
  }

  Container _notificationCard() => Container(
        child: Row(
          children: [
            Image(
              image: AssetImage(dp1png),
              height: 50,
            ),
            Column(children: [Text('data')],)
          ],
        ),
      );
}
