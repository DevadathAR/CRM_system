import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:velocity_x/velocity_x.dart';

class Employees extends StatelessWidget {
  static const route = 'employees-page';
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeProvider(),
      child: Consumer<EmployeeProvider>(
        builder: (context, employeeProvider, child) {
          // Fetch employees when the widget is built
          if (employeeProvider.employees.isEmpty && !employeeProvider.isLoading) {
            employeeProvider.fetchEmployeesData();
          }

          return CustumScaffold(
            body: Expanded(
              child: DefaultTabController(
                length: 2, // Number of tabs
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with dynamic total count
                    'Employees ${employeeProvider.totalCount}'
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
        },
      ),
    );
  }
}
