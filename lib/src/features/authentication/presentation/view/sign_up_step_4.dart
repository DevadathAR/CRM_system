import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpStep4 extends StatelessWidget {
  static const route = 'sign-up-step-4';

  const SignUpStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: VStack(
            [
              const AuthTopSide(),
              VStack(
                [
                  "Invite members"
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
                  ...provider.textFields,
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
                    provider.addTextField(); // Add a new text field when tapped
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
                children: [
                  Expanded(
                    child: PrimaryBlueButton(
                      title: "Previous",
                      onPressed: () {
                        context.goNamed(SignUpStep3.route);
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
                        provider.handleOnboarding(context);
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
      },
    );
  }
}
