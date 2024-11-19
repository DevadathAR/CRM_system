import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          const AuthTopSide(),
          
          VStack(
            [
              32.heightBox,
              SvgPicture.asset(successSvg),
              24.heightBox,
              Align(alignment: Alignment.topCenter,
                child: Text(
                  success,
                  style: AppTextStyle.boldText(size: 18, color: AppColors.black),
                ),
              ),
              16.heightBox,
              Center(
                child: Buttons(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  label: "Let's Start",
                  length: 145,
                  color: AppColors.blue,
                  forward: true,
                  textColor: AppColors.white,
                ),
              ),
              32.heightBox
            ],
          )
              .box
              .width(double.infinity)
              .white
              .rounded
              .shadowLg
              .p16
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .makeCentered(),
          24.heightBox,
          16.heightBox,
        ],
      )
          .scrollVertical()
          .box
          .height(double.infinity)
          .color(AppColors.bgWhite)
          .make(),
    );
  }
}
