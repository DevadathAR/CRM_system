import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class ConfirmTaskStatusDialogue extends StatefulWidget {
  const ConfirmTaskStatusDialogue({super.key});

  @override
  State<ConfirmTaskStatusDialogue> createState() =>
      _ConfirmTaskStatusDialogueState();
}

class _ConfirmTaskStatusDialogueState extends State<ConfirmTaskStatusDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Are you sure you are claiming this task?"
                  .text
                  .textStyle(AppTextStyle.boldText(size: 18))
                  .make()
                  .expand(),
              SvgPicture.asset(
                closeIconSvg,
                colorFilter:
                    ColorFilter.mode(AppColors.lightblack, BlendMode.srcIn),
                height: 18,
                width: 18,
              ).onTap(() => Navigator.pop(context)), // Close button
            ],
          ).p16(),
          "The task will be moved to the Completed section and will be closed."
              .text
              .textStyle(AppTextStyle.regularText(
                  size: 16, color: AppColors.textGrey1))
              .make(),
          25.heightBox,
          PrimaryBlueButton(
              title: "Approve Task",
              onPressed: () {
                context.pop();
              })
        ],
      ).p20(),
    );
  }
}
