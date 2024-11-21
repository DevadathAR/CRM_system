import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpStep2 extends StatelessWidget {
     static const route = 'sign-up-step-2';

  const SignUpStep2({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          const AuthTopSide(),
          

          VStack(
            [
              "STEP 2/4"
                  .text
                  .bold
                  .size(14)
                  .color(AppColors.blue)
                  .makeCentered(),
              16.heightBox,
              yourself.text.bold.size(18).makeCentered(),
              16.heightBox,
              serviceReason.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(
                hintText: mailHint,
                isDropDown: true,
                dropDownOptions: ['Work', 'Research'],
              ),
              24.heightBox,
              describes.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(
                obscureText: true,
                hintText: pswdHint,
                isDropDown: true,
                dropDownOptions: ['Business Owner', 'Employee', 'Freelance'],
              ),
              24.heightBox,
              describes.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              RadioButtonRow(options: ['Yes', 'No']),
              24.heightBox,
            ],
          )
              .box
              .white
              .rounded
              .shadowLg
              .p16
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),

          24.heightBox,

          // Next Step Button
          HStack(
            [
              Buttons(
                ontap: () {
                  Navigator.pop(context);
                },
                label: 'Previous',
                length: 145,
                color: AppColors.bgWhite,
                back: true,
                textColor: AppColors.blue,
              ),
              const Spacer(),
              Buttons(
                ontap: () {
                                    context.goNamed(SignUpStep3.route);

                  },
                label: 'Next Step',
                length: 145,
                forward: true,
                textColor: AppColors.white,
              ),
            ],
          ).px24(),
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
