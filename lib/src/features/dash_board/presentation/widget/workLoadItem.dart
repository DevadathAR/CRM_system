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
        color: Appcolors.backgroindGrey1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: VStack(
        [
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer circular border with gap
              Container(
                height: 70, // Outer border size
                width: 70, // Outer border size
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    startAngle: 0.0,
                    endAngle: 3.14 * 1.9, // Adjust the filled portion (75%)
                    colors: [
                      Appcolors.blue, // Filled color
                      Appcolors.textGrey1.withOpacity(0.4), // Unfilled part
                    ],
                    stops: const [0.75, 0.75], // Transition point
                  ),
                ),
              ),
              // Inner circle with gap
              Container(
                height: 60, // Adjust for gap
                width: 60, // Adjust for gap
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Background color to create the gap
                ),
                child: ClipOval(
                  child: Image.asset(
                    dp1png,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ).centered(), // Ensure the image is centered
                ),
              ).centered(),
            ],
          ),
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
                .border(color: Appcolors.textGrey1) // Add border
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
