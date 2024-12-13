// import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
// import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
// import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
// import 'package:crm_system/src/utilities/colors.dart';
// import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
// import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
// import 'package:crm_system/src/utilities/common_widget/text_field.dart';
// import 'package:crm_system/src/utilities/image_path.dart';
// import 'package:crm_system/src/utilities/strings.dart';
// import 'package:crm_system/src/utilities/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:velocity_x/velocity_x.dart';

// class SignUpStep2 extends StatefulWidget {
//   static const route = 'sign-up-step-2';

//   const SignUpStep2({super.key});

//   @override
//   State<SignUpStep2> createState() => _SignUpStep2State();
// }

// class _SignUpStep2State extends State<SignUpStep2> {
//   final TextEditingController serviceController = TextEditingController();
//   final TextEditingController roleController = TextEditingController();
//   final TextEditingController companyController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadStoredData(); // Load saved data on initialization
//   }

//   /// Loads saved data from SharedPreferences
//   Future<void> _loadStoredData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       serviceController.text = prefs.getString('service') ?? '';
//       roleController.text = prefs.getString('role') ?? '';
//       companyController.text = prefs.getString('company') ?? '';
//     });
//   }

//   /// Stores data in SharedPreferences
//   Future<void> _saveData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('service', serviceController.text);
//     await prefs.setString('role', roleController.text);
//     await prefs.setString('company', companyController.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: VStack(
//         [
//           const AuthTopSide(),

//           VStack(
//             [
//               "STEP 2/4"
//                   .text
//                   .textStyle(
//                       AppTextStyle.boldText(size: 14, color: AppColors.blue))
//                   .makeCentered(),
//               16.heightBox,
//               yourself.text
//                   .textStyle(AppTextStyle.boldText(
//                       size: 18, color: AppColors.lightblack))
//                   .makeCentered(),
//               16.heightBox,
//               greyTitle(text: serviceReason),
//               8.heightBox,
//               // what discribes you best
//               TextInputField(
//                 controller: serviceController,
//                 hintText: mailHint,
//                 isDropDown: true,
//                 dropDownOptions: const ['Work', 'Business'],
//               ),
//               24.heightBox,
//               greyTitle(text: describes),
//               8.heightBox,
//               TextInputField(
//                 controller: roleController,
//                 hintText: pswdHint,
//                 isDropDown: true,
//                 dropDownOptions: const [
//                   'Business Owner',
//                   'Employee',
//                   'Freelance'
//                 ],
//               ),
//               24.heightBox,
//               greyTitle(text: "Chose your company"),
//               8.heightBox,
//               // chose your company
//               TextInputField(
//                 controller: companyController,
//                 hintText: mailHint,
//                 isDropDown: true,
//                 dropDownOptions: const [
//                   'Company A',
//                   'Company B',
//                   'Company C',
//                   'Company D',
//                 ],
//               ),
//               24.heightBox,
//             ],
//           )
//               .box
//               .color(AppColors.white)
//               .withRounded(value: 24)
//               .p20
//               .margin(const EdgeInsets.symmetric(horizontal: 24))
//               .make(),

//           24.heightBox,

//           // Next Step Button
//           Row(
//             children: [
//               Expanded(
//                 child: PrimaryBlueButton(
//                   title: "Previous",
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   backGroundColor: AppColors.primaryBackGround,
//                   elevation: 0,
//                   isprefix: true,
//                   prefixIcon: arrowBackSvg,
//                   prefixColor: AppColors.blue,
//                   labelColor: AppColors.blue,
//                 ),
//               ),
//               Expanded(
//                 child: PrimaryBlueButton(
//                   title: "Next Step",
//                   onPressed: () async {
//                     await _saveData();
//                     context.goNamed(SignUpStep3.route);
//                   },
//                   isSuffix: true,
//                   suffixIcon: arrowForwardSvg,
//                 ),
//               ),
//             ],
//           ).p20(),
//           16.heightBox,
//         ],
//       )
//           .scrollVertical()
//           .box
//           .height(double.infinity)
//           .color(AppColors.bgWhite)
//           .make(),
//     );
//   }
// }
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
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
                  greyTitle(text: "Name"),
                  8.heightBox,
                   TextInputField(
                    controller: provider.nameController,
                    hintText: 'Name',
                  ),
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
                        context.pop();
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
                      onPressed: () async {
                        if (provider.itsEmployee) {
                          provider.handleSignUp(context);
                          context.goNamed(SuccessPage.route);
                        } else {
                          context.goNamed(SignUpStep3.route);
                        }
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
