import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
import 'package:crm_system/src/features/employees/presentation/widget/filter_row.dart';
import 'package:crm_system/src/features/employees/presentation/widget/personal_data_box.dart';
import 'package:crm_system/src/features/employees/presentation/widget/profile_tab_view.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/features/vaccations/model/vaccation_model.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployessProfile extends StatelessWidget {
  static const route = 'employee-profile';
  const EmployessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawerWidget(),
      backgroundColor: AppColors.bgWhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1500),
        ),
        onPressed: (){
          // Show SupportDialog on button press
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddEmployees(); // Your dialog widget
            },
          );
        },
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
            "Employee's Profile"
                .text
                .align(TextAlign.left)
                .size(36)
                .color(AppColors.black)
                .normal
                .make()
                .pSymmetric(h: 24),
            8.heightBox,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: [
                    PersonalDataBox(),
                    FilterRow(),
                     const SizedBox(
                      height: 16,
                    ),
                    ProfileTabView(),
                    
                   

                    
                    16.heightBox,
                    // Tab Content
                    Expanded(
                      child: Consumer<EmployeeProvider>(
                        builder: (context, tabProvider, child) {
                          return Flexible(
                            child: IndexedStack(
                              index: tabProvider.selectedIndex,
                              children: [
                                const Text('Add Project page'),
                                const Text('Add Team page'),
                                VacationBody(
  messages: [
    Message(
      userId: 1,
      vacationRequests: '10',
      sickLeaveRequests: '2',
      wfhRequests: '20',
      requestedby: [
        Requestedby(
          id: 1,
          email: 'evanyates@gmail.com',
          name: 'Evan Yates',
          phone: '123456789',
          userType: 1,
          tagLine: 'Employee',
          userImage: '',
          deletedAt: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )
      ],
    ),
    // Add more Message objects if needed
  ],
)

                              ],
                            ),
                          );
                        },
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

  

 

  
}
