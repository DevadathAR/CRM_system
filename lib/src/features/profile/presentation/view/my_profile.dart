import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/features/employees/presentation/widget/filter_row.dart';
import 'package:crm_system/src/features/employees/presentation/widget/personal_data_box.dart';
import 'package:crm_system/src/features/profile/model/profiile_project_model.dart';
import 'package:crm_system/src/features/profile/presentation/view/settings.dart';
import 'package:crm_system/src/features/profile/presentation/widget/profile_vacation.dart';
import 'package:crm_system/src/features/profile/provider/pageview_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfile extends StatelessWidget {
  static String route = 'user-profile';
  final List<String> titles = ["Project", "Team", "Vacations"];
  final PageController _pageController = PageController();

  MyProfile({super.key}); // Added PageController

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: DefaultTabController(
          length: 3, // Number of tabs
          child: ListView(
            shrinkWrap: true,
            children: [
              24.heightBox,
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "My Profile".text.size(36).color(AppColors.black).make(),
                    IconBox(
                      icon: settingsSVg,
                      backgroundColor: AppColors.white,
                      ontap: () => context.goNamed(Settings.route),
                    ),
                  ],
                ),
              ),
              16.heightBox,
              const PersonalDataBox(),
              16.heightBox,
              const FilterRow(),
              8.heightBox,
              // Tab Selector
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  color: AppColors.textGrey1.withOpacity(0.3),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.black,
                  tabs: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: const Tab(text: "Projects"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: const Tab(text: "Workload"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: const Tab(text: "Vacations"),
                    ),
                  ],
                ),
              ),
              16.heightBox,
              SizedBox(
                height: 500,
                child: TabBarView(
                  children: [
                    _buildProjectList(),
                    _buildWorkloadGrid(),
                    _buildPVacationList(),
                    // Container(height: 200, color: AppColors.green),
                    // Container(height: 200, color: AppColors.yellow),
                    // Container(height: 200, color: AppColors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectList() {
    return Column(
      children: List.generate(mockProjects.length, (index) {
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
      }),
    );
  }

  Widget _buildWorkloadGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisExtent: 180, // Adjusted to avoid clipping
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: mockWorkloadList.length, // Dynamic item count
      itemBuilder: (context, index) {
        // Pass data from the list to workloadItem
        final item = mockWorkloadList[index];
        return WorkloadItem(
          bgColor: AppColors.white,
          progressValue: item.progressValue,
          dpImage: item.dpImage,
          name: item.name,
          role: item.role,
          level: item.level,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Grid inside ListView
    );
  }

  Widget _buildPVacationList() {
    return Column(
      children: List.generate(mockVacationList.length, (index) {
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
          ),
        );
      }),
    );
  }

  Container _pageTitle(context, PageSelectionProvider provider, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(4),
      width: size.width * .27,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color:
            provider.currentPage == index ? AppColors.blue : Colors.transparent,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(titles[index],
            style: provider.currentPage == index
                ? AppTextStyle.boldText(size: 14, color: AppColors.white)
                : AppTextStyle.regularText(size: 14, color: AppColors.black)),
      ),
    );
  }
}
