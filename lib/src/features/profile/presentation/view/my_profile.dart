// import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
// import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
// import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
// import 'package:crm_system/src/features/employees/presentation/widget/filter_row.dart';
// import 'package:crm_system/src/features/employees/presentation/widget/personal_data_box.dart';
// import 'package:crm_system/src/features/profile/model/profiile_project_model.dart';
// import 'package:crm_system/src/features/profile/presentation/view/settings.dart';
// import 'package:crm_system/src/features/profile/presentation/widget/profile_vacation.dart';
// import 'package:crm_system/src/features/profile/provider/pageview_provider.dart';
// import 'package:crm_system/src/services/routeServices.dart';
// import 'package:crm_system/src/utilities/colors.dart';
// import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
// import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
// import 'package:crm_system/src/utilities/image_path.dart';
// import 'package:crm_system/src/utilities/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
// class MyProfile extends StatelessWidget {
//   static const route = 'user-profile';
//    MyProfile({super.key});

//   final List<String> titles = ["Project", "Team", "Vacations"];

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PageviewProvider(),  // Providing the PageviewProvider
//       child: Consumer<PageviewProvider>(
//         builder: (context, tabProvider, child) {
//           return CustumScaffold(
//             ontap: () => showDialog(
//               context: context,
//               builder: (_) => AddEmployees(),
//             ),
//             body: Expanded(
//               child: ListView(
//                 // dragStartBehavior: ,
//                 children: [
//                   24.heightBox,
//                   // Header Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       "My Profile".text.size(36).color(AppColors.black).make(),
//                       IconBox(
//                         icon: settingsSVg,
//                         backgroundColor: AppColors.white,
//                         ontap: () => context.goNamed(Settings.route),
//                       ),
//                     ],
//                   ).pSymmetric(h: 24),
              
//                   16.heightBox,
//                   PersonalDataBox(),
//                   16.heightBox,
//                   FilterRow(),
              
//                   8.heightBox,
//                   // Tab Titles
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                        _customTab('Project', 0, tabProvider),
// _customTab('Team', 1, tabProvider),
// _customTab('Vacation', 2, tabProvider),

//                       ],
//                     ),
//                   ),
//                   16.heightBox,
              
//                   // PageView Section
//                   SizedBox(height: 500,
//                     child: PageView.builder(
//                       controller: tabProvider.pageController,
//                       onPageChanged: tabProvider.onPageChanged,
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         switch (index) {
//                           case 0:
//                             return _buildProjectList();
//                           case 1:
//                             return _buildWorkloadGrid();
//                           case 2:
//                             return _buildPVacationList();
//                           default:
//                             return const SizedBox();
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   Widget _buildProjectList() {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: mockProjects.length,
//       itemBuilder: (context, index) {
//         final project = mockProjects[index];
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: ProjectCard(
//             projectId: project.projectId,
//             projectName: project.projectName,
//             creationDate: project.creationDate,
//             priority: project.priority,
//             allTasks: project.allTasks,
//             activeTasks: project.activeTasks,
//             projectIcon: project.projectIcon,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildPVacationList() {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: mockVacationList.length,
//       itemBuilder: (context, index) {
//         final vacation = mockVacationList[index];
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: ProfileVacation(
//             avatarColor: vacation.avatarColor,
//             leaveType: vacation.leaveType,
//             status: vacation.status,
//             statusContainerColor: vacation.statusContainerColor,
//             dateRange: vacation.dateRange,
//             duration: vacation.duration,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildWorkloadGrid() {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisExtent: 180,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: 6,
//       itemBuilder: (_, __) => workloadItem(bgColor: AppColors.white),
//     );
//   }

//   Widget _customTab(
//       String label, int index, PageviewProvider provider) {
//     bool isSelected = provider.selectedIndex == index;
//     return GestureDetector(

//       onTap: () => provider.jumpToPage(index),
//       child: Container(
//         height: 40,
//         width: 100,
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(13),
//           border: Border.all(
//             color: AppColors.blue,
//             width: 2,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: AppTextStyle.regularText(
//               size: 14,
//               color: isSelected ? AppColors.textGrey1 : AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfile extends StatelessWidget {
  static String route = 'user-profile';
  final List<String> titles = ["Project", "Team", "Vacations"];
  final PageController _pageController = PageController(); // Added PageController

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            24.heightBox,
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "My Profile".text.size(36).color(AppColors.black).make(),
                IconBox(
                  icon: settingsSVg,
                  backgroundColor: AppColors.white,
                  ontap: () => context.goNamed(Settings.route),
                ),
              ],
            ).pSymmetric(h: 24),
        
            16.heightBox,
            const PersonalDataBox(),
            16.heightBox,
            const FilterRow(),
        
            8.heightBox,
            Consumer<PageSelectionProvider>(
              builder: (context, provider, child) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: AppColors.textGrey1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          provider.setPage(index);
                          _pageController.jumpToPage(index); // Sync with PageController
                        },
                        child: _pageTitle(context, provider, index),
                      );
                    }),
                  ),
                );
              },
            ),
        
            16.heightBox,
            // PageView Section
            Consumer<PageSelectionProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height, // Dynamically adapt height
                  child: PageView(
                    controller: _pageController, // Connect PageController
                    onPageChanged: (index) {
                      provider.setPage(index); // Update Provider on swipe
                    },
                    children: [
                      _buildProjectList(),
                      _buildWorkloadGrid(),
                      _buildPVacationList(),
                    ],
                  ),
                );
              },
            ),
          ],
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
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisExtent: 180,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => workloadItem(bgColor: AppColors.white),
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
        child: Text(
          titles[index],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


