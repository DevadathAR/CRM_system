import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonalDataBox extends StatelessWidget {
  const PersonalDataBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 85,
                    height: 85,
                    child: CircularProgressIndicator(
                      value: 0.3,
                      strokeWidth: 3,
                      strokeAlign: 1.5,
                      valueColor: AlwaysStoppedAnimation(AppColors.blue),
                      backgroundColor: AppColors.textGrey1.withOpacity(0.2),
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      dp1png,
                      scale: 1.5,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      color: AppColors.bgWhite),
                  child: SvgPicture.asset(editSvg))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Shawn Stone',
            style: AppTextStyle.boldText(size: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'UI/UX Designer',
            style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          _headerText(label: 'Main Info'),
          _subText(label: 'Position'),
          const TextInputField(),
          _subText(label: 'Company'),
          const TextInputField(),
          _subText(
            label: 'Location',
          ),
          const TextInputField(
            viewIcon: true,
            iconName: locationSvg,
          ),
          _subText(label: 'Birthday Date'),
           TextInputField(
            ontap: () {
             showDialog(
          context: context,
          builder: (context) => const CalanderPopScreen(),
        );
            },
            viewIcon: true,
            iconName: calenderSvg,
          ),
          const SizedBox(
            height: 24,
          ),
          _headerText(label: 'Contact Info'),
          _subText(label: 'Email'),
          const TextInputField(),
          _subText(label: 'Mobile Number'),
          const TextInputField(),
          _subText(label: 'Skype'),
          const TextInputField(),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Padding _headerText({label}) => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 18),
        ),
      );
  Padding _subText({label}) => Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 6),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
        ),
      );
}
