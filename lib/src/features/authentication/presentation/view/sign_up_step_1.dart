import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupStep1 extends StatelessWidget {
  static const route = 'sign-up-step-1';
  SignupStep1({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    return Consumer<AuthProvider>(builder: (_, provider, __) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const AuthTopSide(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "STEP 1/2"
                      .text
                      .textStyle(AppTextStyle.boldText(
                          size: 14, color: AppColors.blue))
                      .makeCentered(),
                  6.heightBox,
                  validfon.text
                      .textStyle(AppTextStyle.boldText(size: 18))
                      .makeCentered(),
                  16.heightBox,
                  greyTitle(text: mob),
                  8.heightBox,
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CountryCodeField(
                          countryCodes: contrycode,
                          controller: provider.codeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Country code is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      8.widthBox,
                      Flexible(
                        flex: 7,
                        child: PhoneNumberField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                            controller: provider.mobileController),
                      ),
                    ],
                  ),
                  24.heightBox,
                  greyTitle(text: sms),
                  8.heightBox,
                  PinCodeTextField(
                    appContext: context,
                    controller: provider.otpController,
                    length: 4,
                    obscureText: false,
                    onChanged: (value) {},
                    onCompleted: (otp) {
                      provider.otpController.text = otp;
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: isSmallScreen ? 50 : 60,
                      fieldWidth: isSmallScreen ? 60 : 70,
                      activeFillColor: AppColors.white,
                      inactiveFillColor: AppColors.white,
                      selectedFillColor: AppColors.white,
                      inactiveColor: AppColors.borderGrey,
                      selectedColor: AppColors.blue,
                      activeColor: AppColors.borderGrey,
                    ),
                  ),
                  24.heightBox,
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
                  greyTitle(text: email),
                  8.heightBox,
                  TextInputField(
                    hintText: mailHint,
                    controller: provider.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  24.heightBox,
                  greyTitle(text: craetepswd),
                  8.heightBox,
                  TextInputField(
                    obscureText: true,
                    hintText: pswdHint,
                    controller: provider.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
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
                  if (_formKey.currentState!.validate()) {
                    context.goNamed(SignupStep2.route);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fil the errors')),
                    );
                  }
                },
                //  provider.handleSignUp,
                title: "Next Step",
     
                backGroundColor: AppColors.blue,
                isSuffix: true,
                suffixIcon: arrowForwardSvg,
              ).pSymmetric(h: 24).objectBottomRight(),
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
    });
  }
}
