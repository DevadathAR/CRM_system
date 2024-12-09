import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/common_widget/custum_text_feild.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const AuthTopSide(),
          // Form Container
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step Indicator
              "STEP 1/4"
                  .text
                  .textStyle(
                      AppTextStyle.boldText(size: 14, color: AppColors.blue))
                  .makeCentered(),
              6.heightBox,
              // Title
              validfon.text
                  .textStyle(AppTextStyle.boldText(
                    size: 18,
                  ))
                  .makeCentered(),
              16.heightBox,
              // Mobile Field
              greyTitle(text: mob),

              8.heightBox,
              Row(
                children: [
                  const Flexible(
                    flex: 3,
                    child: CountryCodeField(countryCodes: contrycode),
                  ),
                  8.widthBox,
                  const Flexible(
                    flex: 7,
                    child: PhoneNumberField(),
                  ),
                ],
              ),

              24.heightBox,

              // SMS Field
              greyTitle(text: sms),

              8.heightBox,
              const SMSCodeInput(),
              24.heightBox,

              // SMS Info Box
              Row(
                children: [
                  SvgPicture.asset(iSvg),
                  8.widthBox,
                  smsText.text
                      .textStyle(AppTextStyle.semiboldText(
                          size: 14, color: AppColors.blue))
                      .softWrap(true)
                      .overflow(TextOverflow.visible)
                      .make()
                      .expand(),
                ],
              )
                  .box
                  .color(AppColors.primaryBackGround)
                  .p16
                  .withRounded(value: 14)
                  .height(100)
                  .make(),
              24.heightBox,

              // Email Field
              greyTitle(text: email),

              8.heightBox,
              const TextInputField(hintText: mailHint),
              24.heightBox,

              // Password Field
              greyTitle(text: craetepswd),

              8.heightBox,
              const TextInputField(obscureText: true, hintText: pswdHint),
              16.heightBox,
            ],
          )
              .box
              .white
              .withRounded(value: 24)
              .p16
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),

          16.heightBox,
          PrimaryBlueButton(
            width: size.width * .45,
            onPressed: () {
              context.goNamed(SignUpStep2.route);
            },
            title: "Next Step",
            backGroundColor: AppColors.blue,
            isSuffix: true,
            suffixIcon: arrowForwardSvg,
          ).pSymmetric(h: 24).objectBottomRight(),
          //Next Step Button

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
