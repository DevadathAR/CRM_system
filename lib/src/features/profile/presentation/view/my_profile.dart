import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/features/employees/presentation/widget/filter_row.dart';
import 'package:crm_system/src/features/employees/presentation/widget/personal_data_box.dart';
import 'package:crm_system/src/features/employees/presentation/widget/profile_tab_view.dart';
import 'package:crm_system/src/features/profile/model/profiile_project_model.dart';
import 'package:crm_system/src/features/profile/presentation/view/settings.dart';
import 'package:crm_system/src/features/profile/presentation/widget/profile_vacation.dart';
import 'package:crm_system/src/services/routeServices.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfile extends StatelessWidget {
  static const route = 'user-profile';
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(ontap: () => showDialog(
          context: context,
          builder: (_) => AddEmployees(),
        ),
      // drawer: const AppDrawerWidget(),
      // backgroundColor: AppColors.bgWhite,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.blue,
      //   shape: const CircleBorder(),
      //   onPressed: () => showDialog(
      //     context: context,
      //     builder: (_) => AddEmployees(),
      //   ),
      //   child: SvgPicture.asset(
      //     addSvg,
      //     colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      //   ),
      // ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "My Profile".text.size(36).color(AppColors.black).make(),
                IconBox(
                  icon: settingsSVg,
                  backgroundColor: AppColors.white,
                  ontap: 
                  () =>context .goNamed(Settings.route),
                )
              ],
            ).pSymmetric(h: 24),
            8.heightBox,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    const PersonalDataBox(),
                    const FilterRow(),
                    16.heightBox,
                    const ProfileTabView(),
                    16.heightBox,
                    Consumer<EmployeeProvider>(
                      builder: (context, tabProvider, _) {
                        return IndexedStack(
                            index: tabProvider.selectedIndex,
                            children: [
                              _buildProjectList(),
                              _buildWorkloadGrid(),
                              _buildPVacationList()
                            ]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicHeightWidget(Widget child) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [child],
      ),
    );
  }

  Widget _buildProjectList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockProjects.length,
      itemBuilder: (context, index) {
        final project = mockProjects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ProjectCard(
            projectId: project.projectId,
            projectName: project.projectName,
            creationDate: project.creationDate,
            priority: project.priority,
            allTasks: project.allTasks,
            activeTasks: project.activeTasks,
            projectIcon: project.projectIcon,
          ),
        );
      },
    );
  }

  Widget _buildPVacationList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockVacationList.length,
      itemBuilder: (context, index) {
        final vacation = mockVacationList[index];
        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ProfileVacation(
              avatarColor: vacation.avatarColor,
              leaveType: vacation.leaveType,
              status: vacation.status,
              statusContainerColor: vacation.statusContainerColor,
              dateRange: vacation.dateRange,
              duration: vacation.duration,
            ));
      },
    );
  }

  Widget _buildWorkloadGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisExtent: 180,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => workloadItem(bgColor: AppColors.white),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
