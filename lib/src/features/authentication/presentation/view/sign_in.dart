import 'dart:convert';
import 'dart:developer';

import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        final response = await AuthService().signIn(email, password);

        log(jsonEncode(response));

        // Handle successful response
        if (response['userType'] == 0) {
          context.goNamed(DashBoard.route);
        } else if (response['userType'] == 1) {
          context.goNamed(DashBoard.route);
        } else if (response['userType'] == 2) {
          context.goNamed(DashBoard.route);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response['message'] ?? 'Sign in failed')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthTopSide(),
          Form(
            key: _formKey,
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
                  controller: _emailController,
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
                  controller: _passwordController,
                  isSearch: false,
                  obscureText: true,
                  hintText: pswdHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 4) {
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

                // Sign In Button
                PrimaryBlueButton(
                  title: "Sign In",
                  onPressed: _handleSignIn,
                ),
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
          ),
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