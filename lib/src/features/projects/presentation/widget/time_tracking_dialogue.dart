import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custum_text_feild.dart';
import 'package:crm_system/src/utilities/common_widget/dialogue_box_title.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TimeTrackingDialogue extends StatelessWidget {
  const TimeTrackingDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading Row
            const DialogueBoxTitle(
              title: "Time Tracking",
            ),
            10.heightBox,
            //timeTracking
            Row(
              children: [
                CircularProgressIndicator(
                  value: 0.3,
                  strokeWidth: 2,
                  strokeAlign: 0.5,
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  backgroundColor: AppColors.textGrey1.withOpacity(0.4),
                ),
                20.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "1d 3h 25m logged"
                        .text
                        .textStyle(AppTextStyle.boldText(size: 16))
                        .make(),
                    "Original Estiamte 3d 8h"
                        .text
                        .textStyle(AppTextStyle.regularText(
                            size: 14, color: AppColors.textGrey2))
                        .make(),
                  ],
                ),
              ],
            )
                .box
                .withRounded(value: 14)
                .color(AppColors.primaryBackGround)
                .make(),
            8.heightBox,
            greyTitle(text: "Time spent"),
            const TextInputField(
              labelText: "1w 4d 6h 40m",
            ),
            8.heightBox,

            greyTitle(text: "Date"),
            const TextInputField(
              viewIcon: true,
              iconName: calenderSvg,
              labelText: "Dec 20, 2020",
            ),
            8.heightBox,
            greyTitle(text: "Time"),
            const TextInputField(
              viewIcon: true,
              iconName: clocNakedkSvg,
              labelText: "2.00 pm",
            ),
            8.heightBox,
            greyTitle(text: "Work Description"),
            8.heightBox,
            const TextInputField(
              height: 150,
              maxlines: 4,
              hintText: "Add some description of the task",
            ),
            10.heightBox,
            PrimaryBlueButton(
              title: "Save",
              onPressed: () {},
            ),
            5.heightBox,
          ],
        ).p20(),
      ),
    );
  }

  // Widget greyTitle({required String text}) {
  //   return Text(
  //     text,
  //     style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
  //   );
  // }
}
