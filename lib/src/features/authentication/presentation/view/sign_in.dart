import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/buttons.dart';
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
      body: VStack(
        [
          // Top Section
          const AuthTopSide(),

          // Form Section
          VStack(
            [
              // Title
              woorkroomsignin.text.bold.size(18).makeCentered(),
              16.heightBox,

              // Email Field
              email.text.bold
                  .size(14)
                  .color(AppColors.textGrey1)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(hintText: mailHint).pSymmetric(h: 8),
              16.heightBox,

              // Password Field
              pswd.text.bold
                  .size(14)
                  .color(AppColors.textGrey1)
                  .make()
                  .objectTopLeft(),
              8.heightBox,
              const TextInputField(obscureText: true, hintText: pswdHint)
                  .pSymmetric(h: 8),
              16.heightBox,

              // Remember Me and Forgot Password Row
              HStack(
                [
                  HStack(
                    [
                      Checkbox(
                        activeColor: AppColors.white,
                        checkColor: AppColors.blue,
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      remember.text.size(14).color(AppColors.black).make(),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: forgot.text.size(14).color(AppColors.textGrey1).make(),
                  ),
                ],
                alignment: MainAxisAlignment.spaceBetween,
              ),
              24.heightBox,

              // Sign In Button
              Buttons(
                      ontap: () {
                        context.goNamed(DashBoard.route);
                      },
                      textColor: AppColors.white,
                      label: 'Sign In')
                  .centered(),
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
