import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/dialogue_box_title.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTaskDialogue extends StatelessWidget {
  const AddTaskDialogue({super.key});

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
            const DialogueBoxTitle(
              title: "Add Task",
            ),
            8.heightBox,
            greyTitle(text: "Task Name"),
            8.heightBox,
            const TextInputField(
              hintText: "Task Name",
            ),
            greyTitle(text: "Task Group"),
            8.heightBox,
            const TextInputField(
              isDropDown: true,
              dropDownOptions: ["Design", "Backend", "FrontEnd"],
            ),
            8.heightBox,
            greyTitle(text: "Estimate"),
            8.heightBox,
            const TextInputField(
              viewIcon: true,
              iconName: clocNakedkSvg,
              hintText: "Select duration",
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
            greyTitle(text: "Assignees"),
            8.heightBox,
            const TextInputField(
              hintText: "Select Assignee",
              isDropDown: true,
              dropDownOptions: ["dev", "arjun", "Nikshay"],
            ),
            8.heightBox,
            greyTitle(text: "Description"),
            8.heightBox,
            const TextInputField(
              height: 150,
              maxlines: 4,
              hintText: "Add some description of the task",
            ),
            10.heightBox,
            Row(
              children: [
                IconBox(
                    vp: 15,
                    hp: 15,
                    icon: attachIconSvg,
                    backgroundColor: AppColors.lightpurple),
                10.widthBox,
                IconBox(
                  vp: 15,
                  hp: 15,
                  icon: linkIconSvg,
                  backgroundColor: AppColors.lightCyan,
                ),
              ],
            ),
            10.heightBox,
            PrimaryBlueButton(
              title: "Save Task",
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
