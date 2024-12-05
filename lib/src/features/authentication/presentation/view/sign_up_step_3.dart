import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_4.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
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

class SignUpStep3 extends StatefulWidget {
  static const route = 'sign-up-step-3';

  const SignUpStep3({super.key});

  @override
  _SignUpStep3State createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3> {
  String? _selectedMember; // This will store the selected member count

  @override
  Widget build(BuildContext context) {
    var memberCount = [
      'Only me',
      '2 - 5',
      '6 - 10',
      '11 - 20',
      '21 - 40',
      '41 - 50',
      '51 - 100',
      '101 - 500'
    ];

    return Scaffold(
      body: Column(
        children: [
          const AuthTopSide(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "STEP 3/4"
                  .text
                  .textStyle(
                      AppTextStyle.boldText(size: 14, color: AppColors.blue))
                  .makeCentered(),
              16.heightBox,
              abtCompany.text
                  .textStyle(AppTextStyle.boldText(
                      size: 18, color: AppColors.lightblack))
                  .makeCentered(),
              16.heightBox,
              greyTitle(text: firmname),
              8.heightBox,
              const TextInputField(
                hintText: firmnameHint,
              ),
              24.heightBox,
              greyTitle(text: businessDir),
              8.heightBox,
              const TextInputField(
                obscureText: true,
                hintText: pswdHint,
                isDropDown: true,
                dropDownOptions: ['IT and Programing', 'HR', 'Pre - sales'],
              ),
              24.heightBox,
              greyTitle(text: members),
              8.heightBox,
              SizedBox(
                height: 210,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => _memberBox(
                    datum: memberCount[index],
                    isSelected: _selectedMember == memberCount[index],
                    onTap: () {
                      setState(() {
                        _selectedMember = memberCount[index];
                      });
                    },
                  ),
                ),
              ),
              8.heightBox,
            ],
          )
              .box
              .white
              // give shadow if needed
              .withRounded(value: 24)
              .p20
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),

          24.heightBox,

          // Next Step Button

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
                    context.goNamed(SignUpStep4.route);
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

  // The updated _memberBox with onTap functionality
  GestureDetector _memberBox({
    required String datum,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      // Replaced onTap() with GestureDetector
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textGrey1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isSelected ? AppColors.blue : AppColors.white,
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              datum,
              style: AppTextStyle.regularText(
                size: 14,
                color: isSelected ? AppColors.white : AppColors.textGrey1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
