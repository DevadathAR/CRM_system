import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return ChangeNotifierProvider(
      create: (_) => TabProvider(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawerWidget(),
        backgroundColor: AppColors.bgWhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1500),
          ),
          onPressed: () {},
          child: SvgPicture.asset(
            addSvg,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        body: SafeArea(
          child: VStack(
            [
              const CustumAppBar(),
              24.heightBox,
              'Employees (28)'
                  .text
                  .size(36)
                  .color(AppColors.black)
                  .normal
                  .make()
                  .pSymmetric(h: 24),
              8.heightBox,
              Consumer<TabProvider>(
                builder: (context, tabProvider, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.bluebox,
                          blurRadius: 6,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(500),
                      color: AppColors.tabGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _tabItem(
                          title: 'List',
                          isSelected: tabProvider.selectedIndex == 0,
                          onTap: () {
                            tabProvider.updateIndex(0);
                          },
                        ),
                        _tabItem(
                          title: 'Activity',
                          isSelected: tabProvider.selectedIndex == 1,
                          onTap: () {
                            tabProvider.updateIndex(1);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              16.heightBox,
              Flexible(
                child: Consumer<TabProvider>(
                  builder: (context, tabProvider, child) {
                    return IndexedStack(
                      index: tabProvider.selectedIndex,
                      children: const [
                        EmployeesList(),
                        EmployeeActivity(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? AppColors.blue : Colors.transparent,
        ),
        child: title.text
            .color(isSelected ? AppColors.white : AppColors.black)
            .makeCentered(),
      ),
    );
  }
}
