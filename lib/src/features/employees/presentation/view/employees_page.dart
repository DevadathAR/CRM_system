import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  int _selectedIndex = 0; // To track the current tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.bluebox,
                      blurRadius: 6,
                      offset: const Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(500),
                color: AppColors.tabGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _tabItem(
                    title: 'List',
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  _tabItem(
                    title: 'Activity',
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            16.heightBox,
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  EmployeesList(),
                  EmployeeActivity(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * .4,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? AppColors.blue : Colors.transparent,
        ),
        child: title.text
            .color(isSelected ? AppColors.white : AppColors.black)
            .makeCentered(),
      ).expand(),
    );
  }
}
