import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:crm_system/src/utilities/image_path.dart';

class NotificationPage extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      dp1png,
      dp2png,
      dp3png,
      dp1png,
      dp2png,
      dp3png,
      dp1png,
      dp2png,
      dp3png,
      dp1png,
      dp2png,
      dp3png,
      dp1png,
      dp2png,
      dp3png,
    ];
    List<String> date = [
      '2 h ago',
      '6 h ago',
      'Today 9:30 AM',
      '2 h ago',
      '6 h ago',
      'Today 9:30 AM',
      '2 h ago',
      '6 h ago',
      'Today 9:30 AM',
      '2 h ago',
      '6 h ago',
      'Today 9:30 AM',
      '2 h ago',
      '6 h ago',
      'Today 9:30 AM',
    ];
    return Dialog(
      insetPadding: const EdgeInsets.all(16), // Padding on all sides
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        // Ensure dialog content respects available space
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            HStack(
              [
                "Notifications"
                    .text
                    .textStyle(AppTextStyle.boldText(size: 18))
                    .make(),
                const Spacer(),
                SvgPicture.asset(
                  closeIconSvg,
                  height: 24,
                  width: 24,
                ).onTap(() => Navigator.pop(context)),
              ],
              alignment: MainAxisAlignment.spaceBetween,
            ),

            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(dp1png),
              height: 50,
            ),
            16.widthBox, // Add spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'You are invited to ',
                          style: AppTextStyle.regularText(
                              size: 16, color: AppColors.black),
                        ),
                        TextSpan(
                          text: 'Company A',
                          style: AppTextStyle.boldText(
                              size: 16, color: AppColors.black),
                        ),
                        
                      ],
                    ),
                  ),
                  16.heightBox,

                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: 
                  [
                    SizedBox(height: 50,width: 100,
                      child: PrimaryBlueButton(title: 'Accept', onPressed: (){
                        print('accept the invite');
                                                context.goNamed(DashBoard.route);

                      }, backGroundColor: AppColors.green,)),
                    SizedBox(height: 50,width: 100,
                      child: PrimaryBlueButton(title: 'Declained', onPressed: (){
                        print('declined the invite');

                      }, backGroundColor: AppColors.red,)),
                    ],)
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0),
                  //   child: Text(
                  //     time,
                  //     style: AppTextStyle.semiboldText(
                  //         size: 14, color: AppColors.textGrey1),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),


            24.heightBox,
            ...List.generate(
              images.length, // Example for generating multiple cards
              (index) =>
                  _notificationCard(image: images[index], time: date[index]),
            ),
          ],
        )
            .box
            .padding(const EdgeInsets.all(16))
            .roundedLg
            .color(AppColors.white)
            .shadowMd
            .make(),
      ),
    );
  }

  Widget _notificationCard({image, time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image),
              height: 50,
            ),
            16.widthBox, // Add spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Emily Tyler',
                          style: AppTextStyle.boldText(
                              size: 16, color: AppColors.black),
                        ),
                        TextSpan(
                          text: ' sent you a comment in ',
                          style: AppTextStyle.regularText(
                              size: 16, color: AppColors.black),
                        ),
                        TextSpan(
                          text: 'Research',
                          style: AppTextStyle.boldText(
                              size: 16, color: AppColors.black),
                        ),
                        TextSpan(
                          text: ' task',
                          style: AppTextStyle.regularText(
                              size: 16, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      time,
                      style: AppTextStyle.semiboldText(
                          size: 14, color: AppColors.textGrey1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
