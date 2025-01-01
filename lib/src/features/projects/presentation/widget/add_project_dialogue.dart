import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/features/projects/provider/project_Provider.dart.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/dialogue_box_title.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class AddProjectDialogue extends StatefulWidget {
  const AddProjectDialogue({super.key});

  @override
  State<AddProjectDialogue> createState() => _AddProjectDialogueState();
}

class _AddProjectDialogueState extends State<AddProjectDialogue> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProjectsProvider>(context, listen: false);

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
          children: [
            const DialogueBoxTitle(title: "Add project"),
            8.heightBox,
            greyTitle(text: "Project Name"),
            8.heightBox,
            TextInputField(
              controller: provider.projectNameController,
              hintText: "Project Name",
            ),
            8.heightBox,
            greyTitle(text: "Starts"),
            8.heightBox,
            CustomDateTimePicker(
              iconName: calenderSvg,
              hintText: 'Select Date',
              onDateSelected: (date) => provider.startDate = date,
            ),
            8.heightBox,
            greyTitle(text: "Deadline"),
            8.heightBox,
            CustomDateTimePicker(
              iconName: calenderSvg,
              hintText: 'Select Date',
              onDateSelected: (date) => provider.deadline = date,
            ),
            8.heightBox,
            greyTitle(text: "Priority"),
            8.heightBox,
            TextInputField(
              isDropDown: true,
              dropcontroller: provider.priorityController,
              dropDownOptions: const ["Medium", "Low", "High"],
              // onChanged: (value) => provider.priorityController.text = value,
            ),
            8.heightBox,
            greyTitle(text: "Reporter"),
            8.heightBox,
            const TextInputField(
              hintText: "Select Reporter",
              isDropDown: true,
              dropDownOptions: ["dev", "arjun", "Nikshay"],
            ),
            provider.assignees.isEmpty
                ? const CircularProgressIndicator()
                : MultiSelectDialogField(
                    items: provider.assignees
                        .map((assignee) => MultiSelectItem(
                              assignee['id'].toString(),
                              assignee['name'],
                            ))
                        .toList(),
                    title: const Text("Select Assignees"),
                    selectedColor: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    buttonIcon: const Icon(
                      Icons.person_add,
                      color: Colors.blue,
                    ),
                    buttonText: Text(
                      "Select Assignees",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                      ),
                    ),
                    onConfirm: (results) {
                      provider.setSelectedAssignees(
                          results.map((e) => e.toString()).toList());
                    },
                  ),
            8.heightBox,
            greyTitle(text: "Description"),
            8.heightBox,
            TextInputField(
              controller: provider.projectDiscriptionController,
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
              onPressed: () async {
                await provider.handleAddProject(context);
              },
            ),
            5.heightBox,
          ],
        ).p20(),
      ),
    );
  }
}

class AvatarSelection extends StatelessWidget {
  const AvatarSelection({super.key});

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
    ];

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
            "Select or upload an avatar for the project (available formats: jpg, png)",
            style:
                AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
          ),
          8.heightBox,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1,
            ),
            itemCount: svgImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //print("Selected: ${svgImages[index]}");
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
