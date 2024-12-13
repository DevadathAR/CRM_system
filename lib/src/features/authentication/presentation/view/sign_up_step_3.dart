// import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_4.dart';
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

// class SignUpStep3 extends StatefulWidget {
//   static const route = 'sign-up-step-3';

//   const SignUpStep3({super.key});

//   @override
//   _SignUpStep3State createState() => _SignUpStep3State();
// }

// class _SignUpStep3State extends State<SignUpStep3> {
//   final TextEditingController firmNameController = TextEditingController();
//   final TextEditingController businessDirController = TextEditingController();
//   final TextEditingController memberSelectionController = TextEditingController();
//   String? _selectedMember; // This will store the selected member count

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedData(); // Load saved data from SharedPreferences
//   }

//   Future<void> _loadSavedData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       firmNameController.text = prefs.getString('firmName') ?? '';
//       businessDirController.text = prefs.getString('businessDir') ?? '';
//       _selectedMember = prefs.getString('selectedMember');
//       memberSelectionController.text = prefs.getString('memberSelection') ?? '';
//     });
//   }

//   Future<void> _saveData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('firmName', firmNameController.text);
//     await prefs.setString('businessDir', businessDirController.text);
//     await prefs.setString('selectedMember', _selectedMember ?? '');
//     await prefs.setString('memberSelection', memberSelectionController.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var memberCount = [
//       'Only me',
//       '2 - 5',
//       '6 - 10',
//       '11 - 20',
//       '21 - 40',
//       '41 - 50',
//       '51 - 100',
//       '101 - 500'
//     ];

//     return Scaffold(
//       body: Column(
//         children: [
//           const AuthTopSide(),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               "STEP 3/4"
//                   .text
//                   .textStyle(
//                       AppTextStyle.boldText(size: 14, color: AppColors.blue))
//                   .makeCentered(),
//               16.heightBox,
//               abtCompany.text
//                   .textStyle(AppTextStyle.boldText(
//                       size: 18, color: AppColors.lightblack))
//                   .makeCentered(),
//               16.heightBox,
//               greyTitle(text: firmname),
//               8.heightBox,
//               TextInputField(
//                 controller: firmNameController,
//                 hintText: firmnameHint,
//               ),
//               24.heightBox,
//               greyTitle(text: businessDir),
//               8.heightBox,
//               TextInputField(
//                 controller: businessDirController,
//                 hintText: pswdHint,
//                 isDropDown: true,
//                 dropDownOptions: ['IT and Programing', 'HR', 'Pre - sales'],
//               ),
//               24.heightBox,
//               greyTitle(text: members),
//               8.heightBox,
//               TextInputField(
//                 controller: memberSelectionController,
//                 hintText: "Enter member count",
//               ),
//               16.heightBox,
//               SizedBox(
//                 height: 210,
//                 child: GridView.builder(
//                   padding: EdgeInsets.zero,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1.8,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemCount: memberCount.length,
//                   itemBuilder: (context, index) => _memberBox(
//                     datum: memberCount[index],
//                     isSelected: _selectedMember == memberCount[index],
//                     onTap: () {
//                       setState(() {
//                         _selectedMember = memberCount[index];
//                         memberSelectionController.text = memberCount[index];
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               8.heightBox,
//             ],
//           )
//               .box
//               .white
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
//                     await _saveData(); // Save data before navigating
//                     context.goNamed(SignUpStep4.route);
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

//   GestureDetector _memberBox({
//     required String datum,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(5),
//         height: 50,
//         width: 80,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.textGrey1),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           color: isSelected ? AppColors.blue : AppColors.white,
//         ),
//         child: Center(
//           child: FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Text(
//               datum,
//               style: AppTextStyle.regularText(
//                 size: 14,
//                 color: isSelected ? AppColors.white : AppColors.textGrey1,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_4.dart';
import 'package:crm_system/src/features/authentication/presentation/widget/auth_top_side.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

// ChangeNotifier class for state management
class SignUpStep3 extends StatelessWidget {
  static const route = 'sign-up-step-3';

  const SignUpStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const SignUpStep3Content(),
    );
  }
}

class SignUpStep3Content extends StatelessWidget {
  const SignUpStep3Content({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

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
              TextInputField(
                controller: provider.firmNameController,
                hintText: firmnameHint,
              ),
              24.heightBox,
              greyTitle(text: businessDir),
              8.heightBox,
              TextInputField(
                dropcontroller: provider.businessDirController,
                hintText: pswdHint,
                isDropDown: true,
                dropDownOptions: ['IT and Programing', 'HR', 'Pre - sales'],
              ),
              24.heightBox,
              greyTitle(text: members),
              8.heightBox,
              TextInputField(
                controller: provider.memberSelectionController,
                hintText: "Enter member count",
              ),
              16.heightBox,
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
                  itemCount: provider.memberCount.length,
                  itemBuilder: (context, index) => _memberBox(
                    datum: provider.memberCount[index],
                    isSelected: provider.selectedMember ==
                        provider.memberCount[index],
                    onTap: () {
                      provider.selectMember(provider.memberCount[index]);
                    },
                  ),
                ),
              ),
              8.heightBox,
            ],
          )
              .box
              .white
              .withRounded(value: 24)
              .p20
              .margin(const EdgeInsets.symmetric(horizontal: 24))
              .make(),

          24.heightBox,

          // Next Step Button
          Row(
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
                  onPressed: () async {
                    // await provider.saveData();
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

  GestureDetector _memberBox({
    required String datum,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
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
