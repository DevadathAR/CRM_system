import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskCardWidget extends StatelessWidget {
  final String taskName;
  final String estimate;
  final String spentTime;
  final String assigneeImageUrl;
  final String priority;
  final String status;
  final Color statusColor;
  final int progress;

  const TaskCardWidget({
    super.key,
    required this.taskName,
    required this.estimate,
    required this.spentTime,
    required this.assigneeImageUrl,
    required this.priority,
    required this.status,
    required this.statusColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Color> getStatusColors(String status) {
      switch (status.toLowerCase()) {
        case 'done':
          return {
            'background': AppColors.lightgreen, // Green background
            'text': AppColors.green, // Light green text
          };
        case 'in progress':
          return {
            'background': AppColors.blue.withOpacity(0.2), // Blue background
            'text': AppColors.blue, // Light blue text
          };
        case 'todo':
          return {
            'background':
                AppColors.textGrey1.withOpacity(0.4), // Grey background
            'text': AppColors.textGrey1, // Light grey text
          };
        case 'In review':
          return {
            'background': AppColors.lightrose, // Rose background
            'text': AppColors.rose, // Light rose text
          };
        default:
          return {
            'background': AppColors.textGrey1, // Default background color
            'text': AppColors.textGrey2, // Default text color
          };
      }
    }

    final colors = getStatusColors(status);
    final double progressValue = progress / 10;

    return Padding(
      padding: const EdgeInsets.all(12.0), // Padding around the card
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0), // Internal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Name Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textColumn(title: "Task Name", value: taskName),
                Transform.flip(
                  flipX: true,
                  child: CircularProgressIndicator(
                    value: progressValue,
                    strokeAlign: -3.0,
                    strokeWidth: 2.3,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppColors.textGrey1.withOpacity(0.4),
                    valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  ).onTap(
                    () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: AppColors.dividergrey),
            const SizedBox(height: 10),

            // Task Details Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _textColumn(title: "Estimate", value: estimate),
                _textColumn(title: "Spent Time", value: spentTime),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    titleText("Assignee"),
                    const SizedBox(height: 4),
                    CircleAvatar(
                      radius: 14,
                      child: Image.asset(assigneeImageUrl),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Priority and Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText("Priority"),
                    5.heightBox,
                    Row(
                      children: [
                        SvgPicture.asset(
                          priority == low ? arrowDownSvg : arrowUpSvg,
                          // color: AppColors.yellow,
                          height: 16,
                          width: 16,
                        ),
                        10.widthBox,
                        priority.text
                            .textStyle(AppTextStyle.boldText(
                                size: 14, color: AppColors.yellow))
                            .make(),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colors['background'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: status.text
                      .textStyle(AppTextStyle.boldText(
                          size: 12, color: colors['text']))
                      .make(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _textColumn({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title),
        const SizedBox(height: 4),
        value.text
            .textStyle(
                AppTextStyle.regularText(size: 16, color: AppColors.lightblack))
            .make(),
      ],
    );
  }
}

Text titleText(title) {
  return Text(
    title,
    style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey2),
  );
}
