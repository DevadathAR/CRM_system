import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:crm_system/src/features/authentication/provider/signIn_provider.dart';
import 'package:crm_system/src/utilities/common_widget/customCheckBox.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  static const route = 'sign-in';
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SigninProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              const AuthTopSide(),
              Form(
                key: GlobalKey<FormState>(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    woorkroomsignin.text
                        .textStyle(AppTextStyle.boldText(
                            size: 18, color: AppColors.lightblack))
                        .makeCentered(),
                    16.heightBox,

                    // Email Field
                    greyTitle(text: email),
                    8.heightBox,
                    TextInputField(
                      controller: provider.signInemailController,
                      isSearch: false,
                      hintText: mailHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    16.heightBox,

                    // Password Field
                    greyTitle(text: pswd),
                    8.heightBox,
                    TextInputField(
                      controller: provider.signInpasswordController,
                      isSearch: false,
                      obscureText: true,
                      hintText: pswdHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    16.heightBox,

                    Wrap(
                      spacing: 10.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 8.0,
                          children: [
                            Customcheckbox(
                              value: provider.isChecked,
                              onChanged: provider.toggleCheckBox,
                            ),
                            10.widthBox,
                            remember.text
                                .textStyle(AppTextStyle.regularText(
                                    size: 14, color: AppColors.lightblack))
                                .make(),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle forgot action here
                          },
                          child: forgot.text
                              .textStyle(AppTextStyle.regularText(
                                  size: 14, color: AppColors.textGrey1))
                              .make(),
                        ),
                      ],
                    ),
                    24.heightBox,

                    // Sign In Button
                    // if (provider.isLoading)
                    //   const Center(child: CircularProgressIndicator()),
                    PrimaryBlueButton(
                      title: provider.isLoading ? "Loading......" : "Sign In",
                      onPressed: () => provider.isLoading
                          ? {}
                          : provider.handleSignIn(context),
                    ),
                    16.heightBox,

                    // Signup Navigation
                    TextButton(
                      onPressed: () {
                        context.goNamed(SignupStep1.route);
                      },
                      child: noacc.text.semiBold
                          .size(16)
                          .color(AppColors.blue)
                          .make(),
                    ).centered(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .shadowLg
                    .p16
                    .margin(const EdgeInsets.symmetric(horizontal: 24))
                    .make(),
              ),
            ],
          )
              .scrollVertical()
              .box
              .height(double.infinity)
              .color(AppColors.bgWhite)
              .make();
        },
      ),
    );
  }
}
