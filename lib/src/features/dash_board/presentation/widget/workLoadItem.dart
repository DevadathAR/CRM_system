import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkloadItem extends StatelessWidget {
  final Color bgColor;
  final double progressValue;
  final String dpImage;
  final String name;
  final String role;
  final String level;

  const WorkloadItem({
    super.key,
    required this.bgColor,
    required this.progressValue,
    required this.dpImage,
    required this.name,
    required this.role,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 210,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: content(),
    );
  }

  VStack content() {
    return VStack(
      [
        10.heightBox,
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              width: 70,
              height: 70,
              child: Transform.flip(
                flipX: true,
                child: CircularProgressIndicator(
                  value: progressValue, // Dynamic value
                  strokeWidth: 4,
                  strokeAlign: 0.5,
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  backgroundColor: AppColors.textGrey1.withOpacity(0.4),
                ),
              ),
            ),
            ClipOval(
              child: Image.asset(
                dpImage, // Dynamic image
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
          ],
        ).centered(),
        10.heightBox,
        name.text
            .textStyle(AppTextStyle.boldText(size: 16))
            .overflow(TextOverflow.ellipsis)
            .maxLines(1)
            .make()
            .centered(), // Dynamic name
        5.heightBox,
        role.text
            .textStyle(AppTextStyle.regularText(size: 14))
            .overflow(TextOverflow.ellipsis)
            .maxLines(1)
            .make()
            .centered(), // Dynamic role
        5.heightBox,
        Flexible(
          child: level.text
              .textStyle(AppTextStyle.semiboldText(size: 12))
              .overflow(TextOverflow.ellipsis)
              .maxLines(1)
              .make()
              .box
              .border(color: AppColors.textGrey1)
              .withRounded(value: 4)
              .p3
              .make()
              .centered(), // Dynamic level
        ),
      ],
      alignment: MainAxisAlignment.center,
    );
  }
}

////////
///

class workloadItem extends StatelessWidget {
  final Color bgColor;
  const workloadItem({
    super.key,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: VStack(
        [
          10.heightBox,

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.white),
                width: 70,
                height: 70,
                child: Transform.flip(
                  flipX: true,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    strokeWidth: 4,
                    strokeAlign: 0.5,
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation(AppColors.blue),
                    backgroundColor: AppColors.textGrey1.withOpacity(0.4),
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  dp1png,
                  // scale: 1.5,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ).centered(),
          10.heightBox,
          "Shawn Stone"
              .text
              .textStyle(AppTextStyle.boldText(size: 16))
              .make()
              .centered(),
          5.heightBox,
          "UI/UX Designer"
              .text
              .textStyle(AppTextStyle.regularText(size: 14))
              .make()
              .centered(),
          5.heightBox,
          // Wrap text with Flexible or Expanded
          Flexible(
            child: "Middle"
                .text
                .textStyle(AppTextStyle.semiboldText(size: 12))
                .make()
                .box
                .border(color: AppColors.textGrey1) // Add border
                .withRounded(value: 4) // Set radius to 4
                .p3 // Optional padding for spacing
                .make()
                .centered(),
          ),
        ],
        alignment: MainAxisAlignment.center,
      ).centered(),
    );
  }
}
