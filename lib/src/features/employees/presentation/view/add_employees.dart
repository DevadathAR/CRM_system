import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEmployees extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();

  AddEmployees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: VStack(
        [
          // Title Row with VelocityX
          HStack(
            [
              "Add Employee"
                  .text
                  .textStyle(AppTextStyle.boldText(size: 18))
                  .make(),
                  Spacer(),
              SvgPicture.asset(
                closeIconSvg,
                height: 24,
                width: 24,
              ).onTap(() => Navigator.pop(context)), // Close button
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
          32.heightBox,

          // Request Subject Label with VelocityX
          "Member's Email"
              .text
              .textStyle(AppTextStyle.boldText(
                size: 14,
                color: AppColors.textGrey1,
              ))
              .make(),
          8.heightBox,

          // TextInputField using VelocityX
          const TextInputField(
            hintText: 'member@gmail.com',
          ),
          24.heightBox,

          // Add Member Text with VelocityX
          HStack(
            [
              SvgPicture.asset(addSvg),
              8.widthBox,
              "Add Member"
                  .text
                  .textStyle(AppTextStyle.semiboldText(size: 16, color: AppColors.blue))
                  .make(),
            ],
          ).onTap(() {}),
          8.heightBox,

          // Approve Button with VelocityX

          PrimaryBlueButton(title: 'Approve')
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context); // Close the dialog
          //       // Add logic to handle request submission here
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.blue,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(14),
          //       ),
          //       padding: const EdgeInsets.symmetric(vertical: 12), // Consistent padding
          //     ),
          //     child: "Approve"
          //         .text
          //         .textStyle(AppTextStyle.boldText(
          //           size: 16,
          //           color: AppColors.white,
          //         ))
          //         .make(),
          //   ),
          // ),
        ],
        // crossAxisAlignment: CrossAxisAlignment.start,
        alignment: MainAxisAlignment.start,
        axisSize: MainAxisSize.min,
      ).box.withRounded(value: 24).p16.color(AppColors.white).shadowMd.make(),
    );
  }
}
