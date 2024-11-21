import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/features/dash_board/provider/dashboardProvider.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_page.dart';
import 'package:crm_system/src/features/projects/presentation/view/projects_list.dart';
import 'package:crm_system/src/features/vaccations/presentation/view/vacations.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';

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
                label: 'Calendar',
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

  Widget _buildListTile({
    required BuildContext context,
    required Widget page,
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
          style: AppTextStyle.boldText(
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
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
