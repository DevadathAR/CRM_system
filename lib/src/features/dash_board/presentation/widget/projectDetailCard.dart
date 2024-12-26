import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';

class ProjectCard extends StatelessWidget {
  final String projectId;
  final String projectName;
  final String creationDate;
  final String priority;
  // final Color priorityColor;
  final int allTasks;
  final int activeTasks;
  final String projectIcon;

  const ProjectCard({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.creationDate,
    required this.priority,
    // required this.priorityColor,
    required this.allTasks,
    required this.activeTasks,
    required this.projectIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.textGrey1,
              offset: const Offset(1, 1),
              blurRadius: .5)
        ],
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(projectIcon, width: 40, height: 40),
              ),
              10.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    projectId.text
                        .textStyle(AppTextStyle.regularText(
                            size: 14, color: AppColors.textGrey2))
                        .make(),
                    projectName.text
                        .textStyle(AppTextStyle.boldText(size: 18))
                        .make(),
                  ],
                ),
              ),
            ],
          ),
          10.heightBox,
          // created date row
          Wrap(
            runSpacing: 5,
            spacing: 30,
            alignment: WrapAlignment.spaceBetween,

            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(calendarGreySvg),
                  10.widthBox,
                  Flexible(
                    flex: 2,
                    child: creationDate.text
                        .textStyle(AppTextStyle.semiboldText(
                            size: 14, color: AppColors.textGrey1))
                        .overflow(TextOverflow.ellipsis)
                        .make(),
                  ),
                ],
              ),
              // const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    priority == "Low"
                        ? arrowDownSvg
                        : arrowUpSvg, // Select the SVG based on priority
                  ),
                  10.widthBox,
                  priority.text
                      .textStyle(
                        AppTextStyle.boldText(
                            size: 14,
                            color: priority == "Low"
                                ? AppColors.green
                                : AppColors.yellow),
                      )
                      .make(),
                ],
              ),
            ],
          ),
          10.heightBox,
          const Divider(),
          10.heightBox,
          "Project Data".text.textStyle(AppTextStyle.boldText(size: 16)).make(),
          10.heightBox,
          // tasks row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2, // Adjust the flex factor as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "All tasks"
                        .text
                        .textStyle(AppTextStyle.regularText(
                            size: 14, color: AppColors.textGrey2))
                        .make(),
                    10.heightBox,
                    "$allTasks"
                        .text
                        .textStyle(AppTextStyle.boldText(size: 16))
                        .make(),
                  ],
                ),
              ),
              Flexible(
                flex: 2, // Adjust the flex factor as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Active tasks"
                        .text
                        .textStyle(AppTextStyle.regularText(
                            size: 14, color: AppColors.textGrey2))
                        .make(),
                    10.heightBox,
                    "$activeTasks"
                        .text
                        .textStyle(AppTextStyle.boldText(size: 16))
                        .make(),
                  ],
                ),
              ),
              Flexible(
                flex: 3, // Allow more space for the assignees
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAssigneeSection(imageUrl: dp1png),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAssigneeSection({required String imageUrl}) {
    List<Widget> buildPositionedAvatars(double screenWidth) {
      // Dynamically adjust offsets based on screen width
      double gap =
          screenWidth < 300 ? 25.0 : 40.0; // Reduce gap for small screens
      List<double> offsets = [0.0, gap, 2 * gap]; // Dynamic horizontal offsets

      return offsets.map((left) {
        return Positioned(
          left: left,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make it circular
                border: Border.all(
                  color: Colors.white, // White border
                  width: 4, // Border width
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Assignees"
                .text
                .textStyle(AppTextStyle.regularText(
                    size: 14, color: AppColors.textGrey2))
                .make(),
            10.heightBox,
            // Wrap the Stack with a SizedBox to control the size and prevent infinite size errors
            SizedBox(
              height: 45, // Control the height of the stack container
              width: screenWidth, // Use available width
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none, // Ensure that images don't get clipped
                children: buildPositionedAvatars(screenWidth),
              ),
            )
          ],
        ).centered();
      },
    );
  }
}
