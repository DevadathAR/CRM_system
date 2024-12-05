import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/services/routeServices.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpStep4 extends StatefulWidget {
  static const route = 'sign-up-step-4';

  const SignUpStep4({super.key});

  @override
  _SignUpStep4State createState() => _SignUpStep4State();
}

class _SignUpStep4State extends State<SignUpStep4> {
  List<Widget> textFields = [
    const TextInputField(hintText: memberMailHint).py8(),
  ];

  void _addTextField() {
    setState(() {
      textFields.add(const TextInputField(hintText: memberMailHint).py8());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          const AuthTopSide(),
          VStack(
            [
              "STEP 4/4"
                  .text
                  .bold
                  .size(14)
                  .color(AppColors.blue)
                  .makeCentered(),
              16.heightBox,
              invite.text.bold.size(18).makeCentered(),
              16.heightBox,
              greyTitle(text: memberMail),
              8.heightBox,
              ...textFields,
              24.heightBox,
              HStack([
                SvgPicture.asset(addSvg),
                const SizedBox(width: 8),
                Text(
                  addMember,
                  style: AppTextStyle.semiboldText(
                      size: 16, color: AppColors.blue),
                ),
              ]).onTap(() {
                _addTextField(); // Add a new text field when tapped
              }),
              16.heightBox,
            ],
          )
              .box
              .white
              .withRounded(value: 24)
              .p20
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),
          24.heightBox,
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
                    context.goNamed(SuccessPage.route);
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
