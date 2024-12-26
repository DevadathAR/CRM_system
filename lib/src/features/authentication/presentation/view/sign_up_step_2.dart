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

  SignupStep2({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                const AuthTopSide(),
                Column(
                  children: [
                    "STEP 2/2"
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this feild is required';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this feild is required';
                        }
                        return null;
                      },
                    ),
                    if (provider.itsEmployee) ...[
                      24.heightBox,
                      greyTitle(text: "Name"),
                      8.heightBox,
                      TextInputField(
                        controller: provider.nameController,
                        hintText: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this feild is required';
                          }
                          return null; 
                        },
                      ),
                      // 16.heightBox,
                      // greyTitle(text: "Choose your company"),
                      // 8.heightBox,
                      // TextInputField(
                      //   controller: provider.companyIdController,
                      //   hintText: mailHint,
                      //   isDropDown: true,
                      //   dropDownOptions: const [
                      //     'Company A',
                      //     'Company B',
                      //     'Company C',
                      //     'Company D',
                      //   ],
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'this feild is required';
                      //     }
                      //     return null;
                      //   },
                      // ),
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
                        title: "SignUp",
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
          ),
        );
      },
    );
  }
}
