import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_page.dart';
import 'package:crm_system/src/features/projects/presentation/view/projects_list.dart';
import 'package:crm_system/src/features/vaccations/presentation/view/vacations.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            // padding: EdgeInsets.zero,
            children: [
              DrawerHeader(

                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  border: Border(),
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
              _buildListTile(
                context: context,
                svgIcon: dashboardIconSvg,
                label: 'Dashboard',
                path: 'Dashboard',
                page: const DashBoard(),
              ),
              _buildListTile(
                context: context,
                svgIcon: projectsIconsSvg,
                label: 'Projects',
                path: 'Projects',
                page: const ProjectsListPage(),
              ),
              _buildListTile(
                context: context,
                svgIcon: calendarGreySvg,
                label: 'Calender',
                path: 'Calender',
                page: const VacationsPage(),
              ),
              _buildListTile(
                context: context,
                svgIcon: employeesIconSvg,
                label: 'Employees',
                path: 'Employees',
                page: const Employees(),
              ),
              _buildListTile(
                context: context,
                svgIcon: aeroplaneSvg,
                label: 'Vacations',
                path: 'Vacations',
                page: const VacationsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for ListTile
  ListTile _buildListTile({
    required BuildContext context,
    required Widget page,
    required String svgIcon,
    required String label,
    required String path,
  }) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      leading: SvgPicture.asset(
        svgIcon,
        width: 24,
        height: 24,
        color: AppColors.textGrey1, // Optional: Apply a color if needed
      ),
      title: Text(
        label,
        style: AppTextStyle.boldText(size: 16, color: AppColors.textGrey1),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
