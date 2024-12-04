import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(
      builder: (context, tabProvider, child) {
        return Column(
          children: [
            Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _tabItem(
                    context,
                    title: 'Project',
                    isSelected: tabProvider.selectedIndex == 0,
                    onTap: () {
                      tabProvider.updateIndex(0);
                    },
                  ),
                  _tabItem(
                    context,
                    title: 'Team',
                    isSelected: tabProvider.selectedIndex == 1,
                    onTap: () {
                      tabProvider.updateIndex(1);
                    },
                  ),
                  _tabItem(
                    context,
                    title: 'Vacation',
                    isSelected: tabProvider.selectedIndex == 2,
                    onTap: () {
                      tabProvider.updateIndex(2);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: PageController(initialPage: tabProvider.selectedIndex),
                itemCount: 3, // Number of pages
                onPageChanged: (index) {
                  tabProvider.updateIndex(index);
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      _getPageContent(index),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _tabItem(
    context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * .275,
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

  String _getPageContent(int index) {
    switch (index) {
      case 0:
        return 'Project Content';
      case 1:
        return 'Team Content';
      case 2:
        return 'Vacation Content';
      default:
        return 'Unknown Content';
    }
  }
}
