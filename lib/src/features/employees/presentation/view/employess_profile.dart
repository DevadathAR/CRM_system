import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployessProfile extends StatelessWidget {
  const EmployessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const custumAppBar(),
            24.heightBox,
            "Employee's Profile"
                .text
                .align(TextAlign.left)
                .size(36)
                .color(AppColors.black)
                .normal
                .make()
                .pSymmetric(h: 24),
            8.heightBox,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: [
                    _personDataBox(),
                    const Row(children: [
                      Text('data'),],)
                    
                    // const Row(
                    //   children: [
                    //      TextInputField(isDropDown: true,),
                    //     Text('data')
                    //   ],
                    // ),
                      ,const SizedBox(height: 150,)
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _personDataBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        
          boxShadow: [
            BoxShadow(
              
                color: AppColors.grey,
                blurRadius: 12,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 85,
                height: 85,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  backgroundColor: AppColors.grey.withOpacity(0.2),
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
            style: AppTextStyle.regularText(size: 14, color: AppColors.grey),
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
          _subText(label: 'Location'),
          const TextInputField(),
          _subText(label: 'Birthday Date'),
          const TextInputField(),
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
          style: AppTextStyle.boldText(size: 14, color: AppColors.grey),
        ),
      );
}
