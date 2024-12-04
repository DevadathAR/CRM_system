import 'package:crm_system/src/features/profile/presentation/view/notification.dart';
import 'package:crm_system/src/features/projects/presentation/widget/confirm_task_status.dart';
import 'package:crm_system/src/features/projects/presentation/widget/radio_tile.dart';
import 'package:crm_system/src/features/projects/presentation/widget/statusContainer.dart';
import 'package:crm_system/src/features/projects/presentation/widget/time_tracking_dialogue.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/acivityCard.dart';
import 'package:crm_system/src/utilities/common_widget/calanderAndCreatedat.dart';
import 'package:crm_system/src/utilities/common_widget/custom_bottomsheet.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskDetailsPage extends StatelessWidget {
  static const route = 'Task_details';

  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String priority = "Low";

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
                  "UX Login + Registration"
                      .text
                      .wrapWords(true)
                      .textStyle(AppTextStyle.boldText(size: 22))
                      .make()
                      .pSymmetric(h: 6),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Task Info"
                            .text
                            .textStyle(
                              AppTextStyle.boldText(
                                  size: 16, color: AppColors.lightblack),
                            )
                            .make()
                            .pSymmetric(h: 10),
                        22.heightBox,
                        // its wrapped in column for adding specific padding
                        Column(
                          children: [
                            greyTitle(text: "Reporter"),
                            8.heightBox,
                            imageName(name: "Evan Yates", imgUrl: dp3png),
                            22.heightBox,
                            greyTitle(text: "Assigned"),
                            8.heightBox,
                            imageName(name: "Blake Silva", imgUrl: dp4png),
                            8.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    greyTitle(text: "Priority"),
                                    8.heightBox,
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          priority == low
                                              ? arrowDownSvg
                                              : arrowUpSvg,
                                          // color: AppColors.yellow,
                                          height: 16,
                                          width: 16,
                                        ),
                                        10.widthBox,
                                        priority.text
                                            .textStyle(AppTextStyle.boldText(
                                                size: 14,
                                                color: priority == low
                                                    ? AppColors.green
                                                    : AppColors.yellow))
                                            .make(),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    greyTitle(text: "Dead Line"),
                                    8.heightBox,
                                    "Feb 23, 2020"
                                        .text
                                        .textStyle(AppTextStyle.regularText(
                                            size: 16,
                                            color: AppColors.lightblack))
                                        .make(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).pSymmetric(h: 14),
                        //greyContainer
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 18),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackGround,
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Time tracking"
                                  .text
                                  .textStyle(AppTextStyle.boldText(
                                      size: 16, color: AppColors.lightblack))
                                  .make(),
                              10.heightBox,
                              Row(
                                children: [
                                  CircularProgressIndicator(
                                    value: 0.3,
                                    strokeWidth: 2,
                                    strokeAlign: 0.5,
                                    strokeCap: StrokeCap.round,
                                    valueColor:
                                        AlwaysStoppedAnimation(AppColors.blue),
                                    backgroundColor:
                                        AppColors.textGrey1.withOpacity(0.4),
                                  ),
                                  20.widthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "1d 3h 25m logged"
                                          .text
                                          .textStyle(
                                              AppTextStyle.boldText(size: 16))
                                          .make(),
                                      "Original Estiamte 3d 8h"
                                          .text
                                          .textStyle(AppTextStyle.regularText(
                                              size: 14,
                                              color: AppColors.textGrey2))
                                          .make(),
                                    ],
                                  ),
                                ],
                              ),
                              20.heightBox,
                              PrimaryBlueButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const TimeTrackingDialogue(),
                                  );
                                },
                                isprefix: true,
                                title: "Log time",
                              ),
                              24.heightBox,
                              const CalenderAndCreatedat(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // 2nd container
                  10.heightBox,
                  "Task Details"
                      .text
                      .wrapWords(true)
                      .textStyle(AppTextStyle.boldText(size: 22))
                      .make()
                      .pSymmetric(h: 6),
                  20.heightBox,
                  //TaskDiscription
                  taskDiscription(context, onTap: () {
                    CustomBottomSheet.show(
                      context: context,
                      title: "Select Task Status",
                      content: SelectTaskStatus(
                        onSelectionChanged: (value) {
                          print("Selected Value: $value");
                        },
                      ),
                      actions: [
                        PrimaryBlueButton(
                          title: "Approve",
                          onPressed: () {
                            // Close the current dialog first
                            Navigator.pop(context);

                            // Then show the second dialog (NotificationPage)
                            showDialog(
                              context: context,
                              builder: (_) => const ConfirmTaskStatusDialogue(),
                            );
                          },
                        ),
                      ],
                    );
                  }),
                  30.heightBox,
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

  Widget taskDiscription(context, {required VoidCallback onTap}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const StatusContainer(
                status: "In Progress",
                isDropdwn: true,
              ).onTap(() {
                // to show BottomSheet
                onTap();
              }),
              IconBox(
                  icon: editSvg, backgroundColor: AppColors.primaryBackGround)
            ],
          ),
          22.heightBox,
          greyTitle(text: "Task Number"),
          8.heightBox,
          "PN0001245"
              .text
              .textStyle(
                AppTextStyle.regularText(size: 16, color: AppColors.lightblack),
              )
              .make(),
          "Description"
              .text
              .textStyle(
                AppTextStyle.boldText(size: 16, color: AppColors.lightblack),
              )
              .make(),
          10.heightBox,
          "Think over UX for Login and Registration, create a flow using wireframes. Upon completion, show the team and discuss. Attach the source to the task."
              .text
              .textStyle(
                AppTextStyle.regularText(size: 14, color: AppColors.lightblack),
              )
              .make(),
          8.heightBox,
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
          ),
          24.heightBox,
          "Task Attachments (3)"
              .text
              .textStyle(
                AppTextStyle.boldText(size: 16, color: AppColors.lightblack),
              )
              .make(),
          16.heightBox,
          attachmentTile(fileName: "SiteScreen.png", fileSize: "10 MB PNG"),
          16.heightBox,
          attachmentTile(fileName: "Wireframes.png", fileSize: "10 MB PNG"),
          16.heightBox,
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightCyan,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(linkIconSvg),
                10.widthBox,
                "Invision Prototype"
                    .text
                    .textStyle(AppTextStyle.semiboldText(
                        size: 16, color: AppColors.cyan))
                    .make(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget attachmentTile({
    required String fileName,
    required String fileSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderGrey, // Grey outline border
          width: 1.0, // Border width
        ),
      ),
      child: ListTile(
        leading: IconBox(
            icon: attachIconSvg, backgroundColor: AppColors.lightpurple),
        title: fileName.text
            .textStyle(
                AppTextStyle.boldText(size: 14, color: AppColors.lightblack))
            .make(),
        subtitle: fileSize.text
            .textStyle(
                AppTextStyle.regularText(size: 12, color: AppColors.textGrey2))
            .make(),
        trailing: IconBox(
            vp: 10,
            hp: 16,
            icon: moreiconSvg,
            backgroundColor: AppColors.primaryBackGround),
      ),
    );
  }

  Row imageName({required String name, required String imgUrl}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          // child: Image.asset(dp2png),
          backgroundImage: AssetImage(imgUrl),
        ),
        14.widthBox,
        name.text
            .textStyle(
                AppTextStyle.regularText(size: 16, color: AppColors.lightblack))
            .make()
      ],
    );
  }

  Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
    );
  }
}
