import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
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
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpStep2 extends StatefulWidget {
  static const route = 'sign-up-step-2';

  const SignUpStep2({super.key});

  @override
  State<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  
  final TextEditingController service = TextEditingController();
  final TextEditingController role = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          const AuthTopSide(),

          VStack(
            [
              "STEP 2/4"
                  .text
                  .textStyle(
                      AppTextStyle.boldText(size: 14, color: AppColors.blue))
                  .makeCentered(),
              16.heightBox,
              yourself.text
                  .textStyle(AppTextStyle.boldText(
                      size: 18, color: AppColors.lightblack))
                  .makeCentered(),
              16.heightBox,
              greyTitle(text: serviceReason),
              8.heightBox,
              const TextInputField(
                hintText: mailHint,
                isDropDown: true,
                dropDownOptions: ['Work', 'Research'],
              ),
              24.heightBox,
              greyTitle(text: describes),
              8.heightBox,
              const TextInputField(
                obscureText: true,
                hintText: pswdHint,
                isDropDown: true,
                dropDownOptions: ['Business Owner', 'Employee', 'Freelance'],
              ),
              24.heightBox,
              greyTitle(text: describes),
              8.heightBox,
              const RadioButtonRow(options: ['Yes', 'No']),
              24.heightBox,
            ],
          )
              .box
              .color(AppColors.white)
              .withRounded(value: 24)
              .p20
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),

          24.heightBox,

          // Next Step Button
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PrimaryBlueButton(
                  title: "Previous",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backGroundColor: AppColors.primaryBackGround,
                  elevation: 0,
                  isprefix: true,
                  prefixIcon: arrowBackSvg,
                  prefixColor: AppColors.blue,
                  labelColor: AppColors.blue,
                ),
              ),
              Expanded(
                child: PrimaryBlueButton(
                  title: "Next Step",
                  onPressed: () {
                    context.goNamed(SignUpStep3.route);
                  },
                  isSuffix: true,
                  suffixIcon: arrowForwardSvg,
                ),
              ),
            ],
          ).p20(),
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