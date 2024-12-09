import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custum_text_feild.dart';
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
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const DialogueBoxTitle(
              title: "Add project",
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
            
            const CustomDateTimePicker(iconName: calenderSvg,
              hintText: 'Select Date',),
           
            8.heightBox,
            greyTitle(text: "Dead Line"),
            8.heightBox,
                
            const CustomDateTimePicker(iconName: calenderSvg,
              hintText: 'Select Date',),
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
            const AvatarSelection(),
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
              title: "Save Project",
              onPressed: () {},
            ),
            5.heightBox,
          ],
        ).p20(),
      ),
    );
  }

  
}

class AvatarSelection extends StatelessWidget {
  const AvatarSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> svgImages = [
      projectavtar1,
      projectAvatar2,
      projectAvatar3,
      projectAvatar4,
      projectAvatarBlue,
      projectAvatarGreen,
      projectAvatarRed,
      projectAvatarPurple,
      projectAvatarRose,
      projectAvatarTeal,
      projectAvatarYellow,
      uploadImageSvg,
    ]; // Example list of SVG image paths

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderGrey),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Select image"
              .text
              .textStyle(
                  AppTextStyle.boldText(size: 18, color: AppColors.lightblack))
              .make(),
          Text(
            "Select or upload an avatar for the project(available formats : jpg,png)",
            style:
                AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
          ),
          8.heightBox,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of columns in the grid
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1, // Square items
            ),
            itemCount: svgImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle image selection
                  print("Selected: ${svgImages[index]}");
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    svgImages[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          8.heightBox,
        ],
      ),
    );
  }
}
