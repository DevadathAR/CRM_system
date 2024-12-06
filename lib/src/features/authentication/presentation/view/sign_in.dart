import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
import 'package:crm_system/src/utilities/common_widget/customCheckBox.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatefulWidget {
  static const route = 'sign-in';
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section
          const AuthTopSide(),

          // Form Section
          Column(
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
              // email.text.bold
              //     .size(14)
              //     .color(AppColors.textGrey1)
              //     .make()
              //     .objectTopLeft(),
              8.heightBox,
              const TextInputField(
                isSearch: false,
                hintText: mailHint,
              ),
              16.heightBox,

              // Password Field
              greyTitle(text: pswd),
              // pswd.text.bold
              //     .size(14)
              //     .color(AppColors.textGrey1)
              //     .make()
              //     .objectTopLeft(),
              8.heightBox,
              const TextInputField(
                isSearch: false,
                obscureText: true,
                hintText: pswdHint,
              ),
              16.heightBox,
              Wrap(
                spacing: 10.0, // Space between items in the same row
                runSpacing: 8.0, // Space between rows
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 10.0, // Space between items in the same row
                    runSpacing: 8.0,
                    // mainAxisSize: MainAxisSize.min, 
                    children: [
                      Customcheckbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
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
              PrimaryBlueButton(
                title: "Sign In",
                onPressed: () {
                  context.goNamed(DashBoard.route);
                },
              ),
              // Sign In Button

              16.heightBox,

              // Signup Navigation
              TextButton(
                onPressed: () {
                  context.goNamed(SignupStep1.route);
                },
                child:
                    noacc.text.semiBold.size(16).color(AppColors.blue).make(),
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
