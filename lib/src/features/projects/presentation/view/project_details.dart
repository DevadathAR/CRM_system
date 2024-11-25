import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class ProjectDetailsPage extends StatelessWidget {
  static const route = 'project_details';

  const ProjectDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustumIconButton(
                isPrefix: true,
                buttonTItle: "Back to Projects",
                icon: arrowBackSvg,
                onTap: () {
                  // navigate to previous page
                  context.pop();
                }).pSymmetric(h: 6),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  "Medical App (iOS native)"
                      .text
                      .wrapWords(true)
                      .textStyle(AppTextStyle.boldText(size: 22))
                      .make()
                      .pSymmetric(h: 6),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                greyTitle(text: "Project Number"),
                                8.heightBox,
                                "PN0001245"
                                    .text
                                    .textStyle(
                                      AppTextStyle.regularText(
                                          size: 16,
                                          color: AppColors.lightblack),
                                    )
                                    .make(),
                              ],
                            ),
                            IconBox(
                                icon: editSvg,
                                backgroundColor: AppColors.primaryBackGround)
                          ],
                        ),
                        20.heightBox,
                        "Description"
                            .text
                            .textStyle(
                              AppTextStyle.boldText(
                                  size: 16, color: AppColors.lightblack),
                            )
                            .make(),
                        10.heightBox,
                        "App for maintaining your medical record, making appointments with a doctor, storing prescriptions"
                            .text
                            .textStyle(
                              AppTextStyle.regularText(
                                  size: 14, color: AppColors.lightblack),
                            )
                            .make(),
                        8.heightBox,
                        greyTitle(text: "Reporter"),
                        8.heightBox,
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(
                                  dp1png), // Pass AssetImage directly
                            ),
                            10.widthBox,
                            "Evan Yates"
                                .text
                                .textStyle(AppTextStyle.regularText(
                                    size: 16, color: AppColors.lightblack))
                                .make(),
                          ],
                        ),
                        8.heightBox,
                        // greyTitle(text: "Assignees"),
                        _buildStackedImages(
                          imageUrls: [
                            dp1png,
                            dp2png,
                            dp3png,
                            dp1png,
                            dp1png,
                            dp2png
                          ],
                        ),
                        20.heightBox,
                        greyTitle(text: "Dead Line"),
                        8.heightBox,
                        "Feb 23, 2020"
                            .text
                            .textStyle(AppTextStyle.regularText(
                                size: 16, color: AppColors.lightblack))
                            .make(),
                        20.heightBox,
                        Row(
                          children: [
                            SvgPicture.asset(calendarGreySvg),
                            10.widthBox,
                            "Created May 28, 2020"
                                .text
                                .textStyle(AppTextStyle.semiboldText(
                                    size: 14, color: AppColors.textGrey1))
                                .make(),
                          ],
                        ),
                        36.heightBox,
                        Row(
                          children: [
                            IconBox(
                              icon: attachIconSvg,
                              backgroundColor: AppColors.lightpurple,
                              // iconColor: AppColors.purple,
                            ),
                            16.widthBox,
                            IconBox(
                              icon: linkIconSvg,
                              backgroundColor: AppColors.lightCyan,
                              // iconColor: AppColors.cyan,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).pSymmetric(h: 20, v: 20),
      ),
    );
  }

  

  Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
    );
  }

  Widget _buildStackedImages({required List<String> imageUrls}) {
    List<Widget> buildPositionedAvatars() {
      List<Widget> widgets = [];
      List<double> offsets = [
        0.0,
        25.0,
        50.0
      ]; // Offsets for the first three images

      // Display the first three images
      for (int i = 0; i < imageUrls.length && i < 3; i++) {
        widgets.add(
          Positioned(
            left: offsets[i],
            child: SizedBox(
              width: 35,
              height: 35,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    imageUrls[i],
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      // Display the remaining count if there are more than 3 images
      if (imageUrls.length > 3) {
        widgets.add(
          Positioned(
            top: 2,
            left: offsets[2] + 27.0, // Position next to the last image
            child: SizedBox(
              width: 30,
              height: 30,
              child: ClipOval(
                child: Container(
                  color: AppColors.blue,
                  child: Text(
                          '+${imageUrls.length - 3}', // Display the count of remaining images
                          style: AppTextStyle.mediumText(
                              size: 14,
                              color: AppColors.white.withOpacity(0.8)))
                      .centered(),
                ),
              ),
            ),
          ),
        );
      }

      return widgets;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        greyTitle(text: "Assignees"),
        10.heightBox,
        SizedBox(
          height: 45, // Control the height of the stack container
          width: 110 +
              (imageUrls.length > 3
                  ? 25
                  : 0), // Adjust width for the "+x" circle
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none, // Ensure that images don't get clipped
            children: buildPositionedAvatars(),
          ),
        ),
      ],
    );
  }
}
