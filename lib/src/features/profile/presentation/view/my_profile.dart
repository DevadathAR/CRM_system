import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/features/employees/presentation/widget/filter_row.dart';
import 'package:crm_system/src/features/employees/presentation/widget/personal_data_box.dart';
import 'package:crm_system/src/features/employees/presentation/widget/profile_tab_view.dart';
import 'package:crm_system/src/features/profile/model/profiile_project_model.dart';
import 'package:crm_system/src/features/profile/presentation/widget/profile_vacation.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfile extends StatelessWidget {
  static const route = 'user-profile';
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawerWidget(),
      backgroundColor: AppColors.bgWhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        shape: const CircleBorder(),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddEmployees(),
        ),
        child: SvgPicture.asset(
          addSvg,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustumAppBar(),
            24.heightBox,
            "My Profile"
                .text
                .size(36)
                .color(AppColors.black)
                .make()
                .pSymmetric(h: 24),
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
                    Flexible(
                      child: Container(
                        color: AppColors.yellow,
                        child: Consumer<EmployeeProvider>(
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
                      ),
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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ProfileVacation(
                avatarColor: vacation.avatarColor,
                leaveType: vacation.leaveType,
                status: vacation.status,
                statusContainerColor: vacation.statusContainerColor,
                dateRange: vacation.dateRange,
                duration: vacation.duration,));
      },
    );
  }

  Widget _buildWorkloadGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisExtent: 180,
        mainAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => const workloadItem(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
