import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/employees/presentation/view/employee_activity.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_list.dart';
import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/features/vaccations/presentation/view/vacations.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployessProfile extends StatelessWidget {
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
        onPressed: () {},
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
                    _personDataBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            child: TextInputField(
                          isDropDown: true,
                          dropDownOptions: ['Current Project', 'Project A'],
                        )),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              color: AppColors.white),
                          child: SvgPicture.asset(
                            filterSvg,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    Consumer<EmployeeProvider>(
                      builder: (context, tabProvider, child) {
                        return Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 24),
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
                        );
                      },
                    ),
                    16.heightBox,
                    // Tab Content
                    Expanded(
                      child: Consumer<EmployeeProvider>(
                        builder: (context, tabProvider, child) {
                          return Flexible(
                            child: IndexedStack(
                              index: tabProvider.selectedIndex,
                              children: const [
                                Text('Add Project page'),
                                Text('Add Team page'),
                                VacationBody()
                              
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

  Widget _personDataBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       color: AppColors.grey,
          //       blurRadius: 12,
          //       offset: const Offset(0, 1))
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 85,
                height: 85,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  backgroundColor: AppColors.grey.withOpacity(0.2),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  dp1png,
                  scale: 1.5,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Shawn Stone',
            style: AppTextStyle.boldText(size: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'UI/UX Designer',
            style: AppTextStyle.regularText(size: 14, color: AppColors.grey),
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          _headerText(label: 'Main Info'),
          _subText(label: 'Position'),
          const TextInputField(),
          _subText(label: 'Company'),
          const TextInputField(),
          _subText(label: 'Location'),
          const TextInputField(),
          _subText(label: 'Birthday Date'),
          const TextInputField(),
          const SizedBox(
            height: 24,
          ),
          _headerText(label: 'Contact Info'),
          _subText(label: 'Email'),
          const TextInputField(),
          _subText(label: 'Mobile Number'),
          const TextInputField(),
          _subText(label: 'Skype'),
          const TextInputField(),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Padding _headerText({label}) => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 18),
        ),
      );
  Padding _subText({label}) => Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 6),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 14, color: AppColors.grey),
        ),
      );
}
