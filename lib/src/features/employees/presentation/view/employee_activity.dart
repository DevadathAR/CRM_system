import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeeActivity extends StatelessWidget {
  const EmployeeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: ListView(
          children: [
            _employeeActivityView(),
          ],
        ),
      ),
    );
  }

  Widget _employeeActivityView() {
    return VStack(
      List.generate(8, (_) => _personDataBox()),
    ).scrollVertical();
  }

  Widget _personDataBox() {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
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
        children: [
          Container(
            width: double.infinity,
            height: 190,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: AppColors.bluebox),
            child: Column(
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
                  style:
                      AppTextStyle.regularText(size: 14, color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: AppColors.bluebox,
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: 'Middle'.text.color(AppColors.grey).makeCentered())
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _boxData(datum: '0', label: backlog),
              _boxData(datum: '16', label: taskProgress),
              _boxData(datum: '6', label: taskReview),
            ],
          )
        ],
      ),
    );
  }

  Column _boxData({datum, label}) => Column(
        children: [
          Text(
            datum,
            style: AppTextStyle.boldText(size: 26),
          ),
          Text(
            textAlign: TextAlign.center,
            label,
            style: AppTextStyle.regularText(size: 14, color: AppColors.grey),
          ),
        ],
      );
}
