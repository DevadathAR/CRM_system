import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/calendar/presentation/view/calander_page.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/features/dash_board/provider/dashboardProvider.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_page.dart';
import 'package:crm_system/src/features/projects/presentation/view/projects_list.dart';
import 'package:crm_system/src/features/vaccations/presentation/view/vacations.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add space around the drawer
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // Optional rounded corners
        child: Drawer(
          width: 250,
          backgroundColor: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset(
                        logoSvg,
                        width: 50, // Adjust the logo size
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile(
                      context: context,
                      svgIcon: dashboardIconSvg,
                      label: 'Dashboard',
                      path: 'Dashboard',
                      page: DashBoard.route,
                    ),
                    _buildListTile(
                      context: context,
                      svgIcon: projectsIconsSvg,
                      label: 'Projects',
                      path: 'Projects',
                      page: ProjectsListPage.route,
                    ),
                    _buildListTile(
                      context: context,
                      svgIcon: calendarGreySvg,
                      label: 'Calendar',
                      path: 'Calender',
                      page: CalanderPage.route,
                    ),
                    _buildListTile(
                      context: context,
                      svgIcon: employeesIconSvg,
                      label: 'Employees',
                      path: 'Employees',
                      page: Employees.route,
                    ),
                    _buildListTile(
                      context: context,
                      svgIcon: aeroplaneSvg,
                      label: 'Vacations',
                      path: 'Vacations',
                      page: VacationsPage.route,
                    ),
                  ],
                ),
              ),
              _supportButton(context),
              // const Spacer(),
              _logoutTile(ontap: () {
                showLogOutDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Padding _logoutTile({required VoidCallback ontap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        leading: SvgPicture.asset(
          logOutIconSvg,
          width: 24,
          height: 24,
          color: AppColors.textGrey1, // Active color
        ),
        title: Text(
          "Logout",
          style: AppTextStyle.semiboldText(
            size: 16,
            color: AppColors.textGrey1, // Active color
          ),
        ),
        onTap: ontap,
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String page,
    required String svgIcon,
    required String label,
    required String path,
  }) {
    final selectedPath =
        context.watch<DashbordProvider>().selectedPath; // Get selected path
    final isSelected =
        selectedPath == path; // Check if the current item is selected

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: isSelected ? AppColors.backgroindGrey1 : AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        leading: SvgPicture.asset(
          svgIcon,
          width: 24,
          height: 24,
          color:
              isSelected ? AppColors.blue : AppColors.textGrey1, // Active color
        ),
        title: Text(
          label,
          style: AppTextStyle.semiboldText(
            size: 16,
            color: isSelected
                ? AppColors.blue
                : AppColors.textGrey1, // Active color
          ),
        ),
        onTap: () {
          context
              .read<DashbordProvider>()
              .selectPath(path); // Update selected path
          context.goNamed(page);
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => page),
          // );
        },
      ),
    );
  }

  Widget _supportButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          // Open the dialog box
          Navigator.pop(context); // Close the drawer

          _showSupportDialog(context);
        },
        child: SizedBox(
          width: 150,
          child: Row(
            children: [
              SvgPicture.asset(chatIconSvg),
              10.widthBox,
              "Support"
                  .text
                  .textStyle(
                      AppTextStyle.boldText(size: 16, color: AppColors.white))
                  .make(),
            ],
          ),
        ).box.p12.color(AppColors.blue).withRounded(value: 14).shadow.make(),
      ),
    );
  }

  void _showSupportDialog(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();

// Define a FocusNode to handle focus events

    // List of dropdown items
    final List<String> dropdownItems = [
      "Technical difficulties",
      "Billing inquiry",
      "Feature request",
      "Account issues",
      "Feedback",
      "Other",
    ];

    // Selected item state
    String selectedItem = dropdownItems[0]; // Default selection

    showDialog(
      // barrierColor: AppColors.primaryBackGround.withOpacity(0.3),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Need some Help"
                        .text
                        .textStyle(AppTextStyle.boldText(size: 18))
                        .make(),
                    SvgPicture.asset(
                      closeIconSvg,
                      height: 24,
                      width: 24,
                    ).onTap(() => Navigator.pop(context)), // Close button
                  ],
                ),
                16.heightBox,

                // Description Text
                "Describe your question and our specialists will answer you within 24 hours."
                    .text
                    .textStyle(AppTextStyle.regularText(size: 16))
                    .make(),
                16.heightBox,

                // Request Subject Label
                "Request Subject"
                    .text
                    .textStyle(AppTextStyle.boldText(
                      size: 14,
                      color: AppColors.textGrey1,
                    ))
                    .make(),
                8.heightBox,

                // Dropdown Button with VelocityX Design
                DropdownButtonFormField<String>(
                  value: selectedItem,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: dropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: item.text
                          .textStyle(AppTextStyle.regularText(size: 14))
                          .make(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedItem = value;
                    }
                  },
                ),
                16.heightBox,

                // Description Input Field
                "Description"
                    .text
                    .textStyle(AppTextStyle.boldText(
                      size: 14,
                      color: AppColors.textGrey1,
                    ))
                    .make(),
                8.heightBox,

                TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Add some description of the request",
                    hintStyle: AppTextStyle.regularText(
                      size: 14,
                      color: AppColors.textGrey1,
                    ),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                16.heightBox,

                // Send Request Button with Full Width
                PrimaryBlueButton(
                  onPressed: () {},
                  title: "Send Request",
                ),
              ],
            ),
          )
              .box
              .withRounded(value: 24)
              .p16
              .color(AppColors.white)
              .shadowMd
              .make(),
        );
      },
    );
  }
}

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Close the dialog
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.goNamed(SignIn.route);
          },
          child: const Text('Log Out'),
        ),
      ],
    ),
  );
}

// // Use it in the logout button
// IconButton(
//   icon: Icon(Icons.logout),
//   onPressed: () => showLogOutDialog(context),
// ),
