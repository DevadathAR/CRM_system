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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Add Project"
                  .text
                  .textStyle(AppTextStyle.boldText(size: 22))
                  .make(),
              SvgPicture.asset(
                closeIconSvg,
                colorFilter:
                    ColorFilter.mode(AppColors.lightblack, BlendMode.srcIn),
                height: 18,
                width: 18,
              ).onTap(() => Navigator.pop(context)), // Close button
            ],
          ),
          8.heightBox,
          greyTitle(text: "Project Name"),
          8.heightBox,
          const TextInputField(
            hintText: "Project Name",
          ),
          8.heightBox,
          greyTitle(text: "Starts"),
          8.heightBox,
          const TextInputField(
            viewIcon: true,
            iconName: calenderSvg,
            hintText: "Select Date",
          ),
          8.heightBox,
          greyTitle(text: "Dead Line"),
          8.heightBox,
          const TextInputField(
            hintText: "Select Date",
            viewIcon: true,
            iconName: calenderSvg,
          ),
          8.heightBox,
          greyTitle(text: "Priority"),
          8.heightBox,
          const TextInputField(
            isDropDown: true,
            dropDownOptions: ["Medium", "Low", "High"],
          ),
          8.heightBox,
          greyTitle(text: "Description"),
          8.heightBox,
          const TextInputField(
            height: 150,
            maxlines: 4,
            hintText: "Add some description of the project",
          ),
        ],
      ).p20(),
    );
  }

  Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
    );
  }
}
