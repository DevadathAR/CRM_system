// import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
// import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
// import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
// import 'package:crm_system/src/utilities/colors.dart';
// import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
// import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
// import 'package:crm_system/src/utilities/common_widget/drawer.dart';
// import 'package:crm_system/src/utilities/image_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Employees extends StatelessWidget {
//   static const route = 'employees-page';
//   const Employees({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustumScaffold(

//       body: ChangeNotifierProvider(
//         create: (_) => EmployeeProvider(),
//         child: Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               'Employees (28)'
//                   .text
//                   .align(TextAlign.start)
//                   .size(36)
//                   .color(AppColors.black)
//                   .normal
//                   .make()
//                   .pSymmetric(h: 24),
//               8.heightBox,
//               // Tab Selector
//               Consumer<EmployeeProvider>(
//                 builder: (context, tabProvider, child) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.primaryBackGround,
//                           blurRadius: 6,
//                           offset: const Offset(0, 1),
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(500),
//                       color: AppColors.backgroindGrey1,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _tabItem(
//                           context,
//                           title: 'List',
//                           isSelected: tabProvider.selectedIndex == 0,
//                           onTap: () {
//                             tabProvider.updateIndex(0);
//                           },
//                         ),
//                         _tabItem(
//                           context,
//                           title: 'Activity',
//                           isSelected: tabProvider.selectedIndex == 1,
//                           onTap: () {
//                             tabProvider.updateIndex(1);
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               16.heightBox,
//               // Tab Content
//               Expanded(
//                 child: Consumer<EmployeeProvider>(
//                   builder: (context, tabProvider, child) {
//                     return IndexedStack(
//                       index: tabProvider.selectedIndex,
//                       children: const [
//                         EmployeesList(),
//                         EmployeeActivity(),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _tabItem(
//     context, {
//     required String title,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: size.width * .4,
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: isSelected ? AppColors.blue : Colors.transparent,
//         ),
//         child: title.text
//             .color(isSelected ? AppColors.white : AppColors.black)
//             .makeCentered(),
//       ),
//     );
//   }
// }


import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Employees extends StatelessWidget {
  static const route = 'employees-page';
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: DefaultTabController(
          length: 2, // Number of tabs
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              'Employees (28)'
                  .text
                  .align(TextAlign.start)
                  .size(36)
                  .color(AppColors.black)
                  .normal
                  .make()
                  .pSymmetric(h: 24),
              8.heightBox,
              // Tab Selector
              LayoutBuilder(
                builder: (context, constraints) {
                  final tabWidth = constraints.maxWidth * 0.4; // 40% of screen width
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBackGround,
                          blurRadius: 6,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(500),
                      color: AppColors.backgroindGrey1,
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.black,
                      dividerColor: Colors.white.withOpacity(0),
                      
                      tabs: [
                        SizedBox(
                          width: tabWidth,
                          child: const Tab(text: 'List'),
                        ),
                        SizedBox(
                          width: tabWidth,
                          child: const Tab(text: 'Activity'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              16.heightBox,
              // Tab Content
              const Expanded(
                child: TabBarView(
                  children: [
                    EmployeesList(),
                    EmployeeActivity(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
