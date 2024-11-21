import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class workloadItem extends StatelessWidget {
  const workloadItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroindGrey1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: VStack(
        [
          10.heightBox,
          
          Stack(
            alignment: Alignment.center,
            children: [
               SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.3,
                  strokeWidth: 4,
                  strokeAlign: 0.5,
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  backgroundColor: AppColors.textGrey1.withOpacity(0.4),
                ),
              ),
              Container(
                height: 60,width: 60,decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.white),
                child: ClipOval(
                  child: Image.asset(
                    dp1png,
                    // scale: 1.5,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
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
