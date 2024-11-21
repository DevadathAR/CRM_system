import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupStep1 extends StatelessWidget {
  static const route = 'sign-up-step-1';
  const SignupStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          const AuthTopSide(),

          // Form Container
          VStack(
            [
              // Step Indicator
              "STEP 1/4"
                  .text
                  .bold
                  .size(14)
                  .color(AppColors.blue)
                  .makeCentered(),
              16.heightBox,
              // Title
              validfon.text.bold.size(18).makeCentered(),
              16.heightBox,

              // Mobile Field
              mob.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              HStack(
                [
                  const CountryCodeField(countryCodes: contrycode),
                  16.widthBox,
                  const PhoneNumberField(),
                ],
              ),
              24.heightBox,

              // SMS Field
              sms.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const SMSCodeInput(),
              24.heightBox,

              // SMS Info Box
              HStack(
                [
                  SvgPicture.asset(iSvg),
                  8.widthBox,
                  smsText.text.semiBold
                      .size(14)
                      .color(AppColors.blue)
                      .softWrap(true)
                      .overflow(TextOverflow.visible)
                      .make()
                      .expand(),
                ],
                alignment: MainAxisAlignment.start,
              ).box.color(AppColors.bluebox).p16.rounded.height(100).make(),
              24.heightBox,

              // Email Field
              email.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(hintText: mailHint),
              24.heightBox,

              // Password Field
              craetepswd.text.bold
                  .size(14)
                  .color(AppColors.grey)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(obscureText: true, hintText: pswdHint),
              16.heightBox,
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
              const Spacer(),
              Buttons(
                  ontap: () {
                    context.goNamed(SignUpStep2.route);
                  },
                  label: 'Next Step',
                  forward: true,
                  textColor: AppColors.white,
                  length: 145),
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
