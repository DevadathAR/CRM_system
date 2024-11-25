import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/acivityCard.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskDetailsPage extends StatelessWidget {
  static const route = 'Task_details';

  const TaskDetailsPage({super.key});

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
                }
                ).pSymmetric(h: 6),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  "UX Login + Registration"
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
                          greyTitle(text: "Task Number"),
                          8.heightBox,
                          "PN0001245"
                              .text
                              .textStyle(
                                AppTextStyle.regularText(
                                    size: 16, color: AppColors.lightblack),
                              )
                              .make(),
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
                        ],
                      )),
                  ActivityCard(
                    heading: "Recent Activity",
                    headingSize: 16,
                    onViewMoreTap: () {},
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
}
