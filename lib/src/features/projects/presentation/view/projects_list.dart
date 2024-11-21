import 'package:crm_system/src/features/dash_board/presentation/widget/taskCard.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class ProjectsListPage extends StatelessWidget {
  static  const route = 'projects';
  const ProjectsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.backgroindGrey2,
      drawer: const AppDrawerWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: SvgPicture.asset(
            addSvg,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CustumAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  20.heightBox,
                  "Projects".text.bold.size(36).make(),
                  10.heightBox,

                  /// jdbkbdfkhkhsdkfhskhf
                  _projectnameNid(),

                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Tasks"
                          .text
                          .textStyle(AppTextStyle.boldText(size: 22))
                          .make(),
                      SvgPicture.asset(
                        taskIconSvg,
                        color: AppColors.black,
                      )
                          .box
                          .withRounded(value: 14)
                          .color(AppColors.white)
                          .p12
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  _greyHeadingBox(title: "Active Tasks"),
                  10.heightBox,
                  const TaskCardWidget(
                    progress: 6, //(progess out of 10)
                    taskName: "Research",
                    estimate: "2d 4h",
                    spentTime: "1d 2h",
                    assigneeImageUrl: dp1png, // Replace with actual URL
                    priority: "Medium",
                    status: "Done",
                    statusColor: Colors.greenAccent,
                  ),
                  const TaskCardWidget(
                    progress: 6, //(progess out of 10)
                    taskName: "Research",
                    estimate: "2d 4h",
                    spentTime: "1d 2h",
                    assigneeImageUrl: dp1png, // Replace with actual URL
                    priority: "Low",
                    status: "Done",
                    statusColor: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

  Container _projectnameNid() {
    return Container(
      // margin: const EdgeInsets.symmetric(
      //     horizontal: 4, vertical: 8), // Spacing between cards
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
                Row(
                  children: [
                    // Title
                    Expanded(
                      child: "Medical App (iOS native)"
                          .toString()
                          .text
                          .maxLines(2)
                          .overflow(TextOverflow.ellipsis)
                          .textStyle(AppTextStyle.boldText(size: 16))
                          .make()
                          .pOnly(left: 10),
                    ),
                    // Icon
                    SvgPicture.asset(
                      dropDownIconSvg,
                      color: AppColors.black,
                    )
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    CustumIconButton(
                      buttonTItle: "View details",
                      icon: nextArrowSvg,
                      onTap: () {},
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
