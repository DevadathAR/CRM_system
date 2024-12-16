import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupStep2 extends StatelessWidget {
  static const route = 'sign-up-step-2';

  const SignupStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          body: VStack(
            [
              const AuthTopSide(),
              VStack(
                [
                  "STEP 2/4"
                      .text
                      .textStyle(AppTextStyle.boldText(
                          size: 14, color: AppColors.blue))
                      .makeCentered(),
                  16.heightBox,
                  yourself.text
                      .textStyle(AppTextStyle.boldText(
                          size: 18, color: AppColors.lightblack))
                      .makeCentered(),
                  16.heightBox,
                  greyTitle(text: serviceReason),
                  8.heightBox,
                  TextInputField(
                    dropcontroller: provider.userTypeController,
                    hintText: mailHint,
                    isDropDown: true,
                    dropDownOptions: const ['Work', 'Business'],
                    onChanged: (value) {},
                  ),
                  24.heightBox,
                  greyTitle(text: describes),
                  8.heightBox,
                  TextInputField(
                    dropcontroller: provider.roleController,
                    hintText: pswdHint,
                    isDropDown: true,
                    dropDownOptions: const [
                      'Business Owner',
                      'Employee',
                    ],
                  ),
                  if (provider.itsEmployee) ...[
                    24.heightBox,
                    greyTitle(text: "Name"),
                    8.heightBox,
                    TextInputField(
                      controller: provider.nameController,
                      hintText: 'Name',
                    ),
                    16.heightBox,
                    greyTitle(text: "Choose your company"),
                    8.heightBox,
                    TextInputField(
                      controller: provider.companyIdController,
                      hintText: mailHint,
                      isDropDown: true,
                      dropDownOptions: const [
                        'Company A',
                        'Company B',
                        'Company C',
                        'Company D',
                      ],
                    ),
                  ],
                ],
              )
                  .box
                  .color(AppColors.white)
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
                        // context.pop();
                        context.goNamed(SignupStep1.route);
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
                    child:
                        //  provider.nameController.text.isEmpty ||
                        //         provider.userTypeController.text.isEmpty ||
                        //         provider.roleController.text.isEmpty
                        //     ?
                        //  PrimaryBlueButton(
                        //     title: "Next Step",
                        //     backGroundColor: AppColors.textGrey1,
                        //     onPressed: () {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //             content: Text('Fill all the fields')),
                        //       );
                        //     },
                        //     isSuffix: true,
                        //     suffixIcon: arrowForwardSvg,
                        //   )
                        // :
                        PrimaryBlueButton(
                      title: "Next Step",
                      onPressed: () async {
                        provider.handleSignUp(context);
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
