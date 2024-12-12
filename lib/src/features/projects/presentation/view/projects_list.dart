import 'package:crm_system/src/features/projects/presentation/widget/add_project_dialogue.dart';
import 'package:crm_system/src/features/projects/presentation/widget/add_task_dialogue.dart';
import 'package:crm_system/src/features/projects/presentation/widget/taskCard.dart';
import 'package:crm_system/src/features/projects/model/taskModel.dart';
import 'package:crm_system/src/features/projects/presentation/view/project_details.dart';
import 'package:crm_system/src/features/projects/presentation/view/task_details.dart';
import 'package:crm_system/src/features/projects/presentation/widget/filterDialogue.dart';
import 'package:crm_system/src/features/projects/provider/taskProvider.dart.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/custum_text_feild.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProjectsListPage extends StatelessWidget {
  static const route = 'projects';
  const ProjectsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return CustumScaffold(
      ontap: () {
        showDialog(
          context: context,
          builder: (context) => const AddTaskDialogue(),
        );
      },
      body: Expanded(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            20.heightBox,
            "Projects".text.textStyle(AppTextStyle.boldText(size: 36)).make(),
            10.heightBox,

            /// jdbkbdfkhkhsdkfhskhf
            _projectnameNid(
                ontap: () => context.goNamed(ProjectDetailsPage.route)),

            15.heightBox,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Tasks".text.textStyle(AppTextStyle.boldText(size: 22)).make(),
                if (mockTasks.isNotEmpty)
                  SvgPicture.asset(filterIconSvg,
                          colorFilter: ColorFilter.mode(
                              AppColors.black, BlendMode.srcIn))
                      .box
                      .withRounded(value: 14)
                      .color(AppColors.white)
                      .p12
                      .make()
                      .onTap(
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => const FilterDialog(),
                      );
                    },
                  ),
              ],
            ),
            10.heightBox,
            if (mockTasks.isEmpty) ...[
              _noTaskPlaceholder(),
            ] else ...[
              _greyHeadingBox(title: "Active Tasks"),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustumIconButton(
                          isPrefix: true,
                          buttonTItle: "Design (6 issues)",
                          icon: dropUpIconSvg,
                          onTap: () {
                          })
                      .pSymmetric(h: 20)
                      .onTap(() {
                    context.read<ProjectsProvider>().toggleExpanded();
                  }),
                  10.heightBox,
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap:
                        true, // Optional, but useful when dealing with nested lists

                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockTasks.length,
                    itemBuilder: (context, index) {
                      final task = mockTasks[index];

                      return TaskCardWidget(
                        isBacklog: false,
                        progress: task.progress,
                        taskName: task.taskName,
                        estimate: task.estimate,
                        spentTime: task.spentTime,
                        assigneeImageUrl: task.assigneeImageUrl,
                        priority: task.priority,
                        status: task.status,
                        onTap: () {
                          context.pushNamed(TaskDetailsPage.route);
                        },
                      );
                    },
                  ),
                  10.heightBox,
                  _greyHeadingBox(title: "Backlog"),
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap:
                        true, // Optional, but useful when dealing with nested lists

                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockTasks.length,
                    itemBuilder: (context, index) {
                      final task = mockTasks[index];

                      return TaskCardWidget(
                        isBacklog: true,
                        progress: task.progress,
                        taskName: task.taskName,
                        estimate: task.estimate,
                        spentTime: task.spentTime,
                        assigneeImageUrl: task.assigneeImageUrl,
                        priority: task.priority,
                        status: task.status,
                        onTap: () => context.pushNamed(TaskDetailsPage.route),
                      );
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _noTaskPlaceholder() {
    return Column(
      children: [
        SvgPicture.asset(noTaskPlaceHolderSvg),
        10.heightBox,
        "There are no taks in this project yet Lets add them"
            .text
            .textStyle(
                AppTextStyle.boldText(size: 16, color: AppColors.lightblack))
            .make(),
      ],
    );
  }

  Widget _greyHeadingBox({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroindGrey1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: title.text
          .textStyle(AppTextStyle.boldText(
            size: 16,
            color: AppColors.black,
          ))
          .make()
          .centered(),
    );
  }

  Widget _projectnameNid({required VoidCallback ontap}) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 0, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Aligns children at the top
        children: [
          // blue line
          Container(
            height: 80,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.blue,
            ),
          ),
          10.widthBox,
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // CrossAxisAlignment.start, // Align text to the start
              children: [
                // Event Title and Icon
                "PN0001245"
                    .text
                    .textStyle(AppTextStyle.regularText(
                        size: 12, color: AppColors.textGrey2))
                    .make()
                    .pOnly(left: 10),
                const TextInputField(
                  isBorder: false,
                  isDropDown: true,
                  dropDownOptions: [
                    "Medical App (iOS native",
                    "Food Delivery Service",
                    "Food Delivery ",
                  ],
                ),

                10.heightBox,
                Row(
                  children: [
                    CustumIconButton(
                      buttonTItle: "View details",
                      icon: nextArrowSvg,
                      onTap: ontap,
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
