import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProjectDialogue extends StatefulWidget {
  const AddProjectDialogue({super.key});

  @override
  State<AddProjectDialogue> createState() => _AddProjectDialogueState();
}

class _AddProjectDialogueState extends State<AddProjectDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Add Project"
                  .text
                  .textStyle(AppTextStyle.boldText(size: 22))
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
          greyTitle(text: "Project Name"),
          const TextInputField(
            hintText: "Project Name",
          )
        ],
      ).p20(),
    );
  }
}
