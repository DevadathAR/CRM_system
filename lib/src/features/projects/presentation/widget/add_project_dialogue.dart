import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/features/projects/presentation/view/project_details.dart';
import 'package:crm_system/src/features/projects/provider/project_Provider.dart.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/dialogue_box_title.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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
            const SearchUser(
              hintText: "Search Reporter",
              isAssignee: false,
            ),

            // const TextInputField(
            //   hintText: "Select Reporter",
            //   isDropDown: true,
            //   dropDownOptions: ["dev", "arjun", "Nikshay"],
            // ),
            greyTitle(text: "Assignees"),
            const SearchUser(
              isAssignee: true,
              hintText: "Search Assignees",
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

class AvatarSelection extends StatefulWidget {
  const AvatarSelection({super.key});

  @override
  _AvatarSelectionState createState() => _AvatarSelectionState();
}

class _AvatarSelectionState extends State<AvatarSelection> {
  final ImagePicker _picker = ImagePicker();

  // Function to pick and upload an image
  Future<void> _pickAndUploadImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the picked image via the provider
      await Provider.of<ProjectsProvider>(context, listen: false)
          .uploadIcon(pickedFile.path);
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch the icons when the widget is first initialized
    Provider.of<ProjectsProvider>(context, listen: false).fetchIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsProvider>(
      builder: (context, projectProvider, child) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.borderGrey),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Select image"
                  .text
                  .textStyle(AppTextStyle.boldText(
                      size: 18, color: AppColors.lightblack))
                  .make(),
              Text(
                "Select or upload an avatar for the project (available formats: jpg, png)",
                style: AppTextStyle.regularText(
                    size: 14, color: AppColors.textGrey1),
              ),
              8.heightBox,
              // Show a loading indicator while fetching icons
              if (projectProvider.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemCount:
                      projectProvider.icons.length + 1, // Add upload button
                  itemBuilder: (context, index) {
                    if (index == projectProvider.icons.length) {
                      // Upload button as last icon
                      return GestureDetector(
                        onTap: _pickAndUploadImage,
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            uploadImageSvg,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else {
                      // Display fetched icons from the backend
                      return GestureDetector(
                        onTap: () {
                          // Handle selection of an icon and set icon ID
                          projectProvider
                              .selectIcon(projectProvider.icons[index]);
                          print("Selected: ${projectProvider.icons[index]}");
                        },
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.network(
                            "http://192.168.1.50:8000/${projectProvider.icons[index]}", // Display icon from URL
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }
                  },
                ),
              8.heightBox,
            ],
          ),
        );
      },
    );
  }
}

// class AvatarSelection extends StatelessWidget {
//   const AvatarSelection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> svgImages = [
//       projectavtar1,
//       projectAvatar2,
//       projectAvatar3,
//       projectAvatar4,
//       projectAvatarBlue,
//       projectAvatarGreen,
//       projectAvatarRed,
//       projectAvatarPurple,
//       projectAvatarRose,
//       projectAvatarTeal,
//       projectAvatarYellow,
//       uploadImageSvg,
//     ];

//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: AppColors.borderGrey),
//           borderRadius: BorderRadius.circular(24)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           "Select image"
//               .text
//               .textStyle(
//                   AppTextStyle.boldText(size: 18, color: AppColors.lightblack))
//               .make(),
//           Text(
//             "Select or upload an avatar for the project (available formats: jpg, png)",
//             style:
//                 AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
//           ),
//           8.heightBox,
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 1,
//             ),
//             itemCount: svgImages.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   //print("Selected: ${svgImages[index]}");
//                 },
//                 child: SizedBox(
//                   height: 25,
//                   width: 25,
//                   child: SvgPicture.asset(
//                     svgImages[index],
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               );
//             },
//           ),
//           8.heightBox,
//         ],
//       ),
//     );
//   }
// }

class SearchUser extends StatelessWidget {
  final String hintText;
  final bool isAssignee;
  const SearchUser({
    super.key,
    required this.hintText,
    this.isAssignee = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProjectsProvider>(context);
    // Define independent loading, error, and user list based on context
    final isLoading =
        isAssignee ? provider.isAssigneeLoading : provider.isReporterLoading;
    final errorMessage = isAssignee
        ? provider.assigneeErrorMessage
        : provider.reporterErrorMessage;
    final users = isAssignee ? provider.assigneeUsers : provider.reporterUsers;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          controller: isAssignee
              ? provider.searchAssigneeController
              : provider.searchReporterController,
          hintText: hintText,
          viewIcon: true,
          iconName: searchIcon,
          ontap: () {
            final searchQuery = isAssignee
                ? provider.searchAssigneeController.text
                : provider.searchReporterController.text;
            isAssignee
                ? provider.fetchAssignees(searchQuery)
                : provider.fetchReporters(searchQuery);
          },
        ),
        5.heightBox,
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (errorMessage != null)
          Center(child: Text(errorMessage))
        else
          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              // final isSelected = provider.selectedAssignees.contains(user);

              return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user['name'] ?? 'No Name'),
                      Text(user['email'] ?? 'No Email'),
                    ],
                  )).onTap(() {
                // Toggle selection based on context (assignee or reporter)
                if (isAssignee) {
                  provider.toggleAssigneeSelection(user);
                } else {
                  provider.setReporter(user); // Handle reporter selection
                }
              });
            },
          ),
        5.heightBox,
        if (isAssignee && provider.selectedAssignees.isNotEmpty)
          Wrap(
            children: provider.selectedAssignees.map((assignee) {
              return Chip(
                label: Text(assignee['name'] ?? 'No Name'),
                onDeleted: () => provider.toggleAssigneeSelection(assignee),
              );
            }).toList(),
          ),
        if (!isAssignee && provider.reporter != null)
          Chip(
            label: Text(provider.reporter!['name'] ?? 'No Name'),
            onDeleted: () => provider.clearReporter(),
          ),
      ],
    );
  }
}
