import 'package:crm_system/src/features/employees/presentation/view/employess_profile.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class DataBox extends StatelessWidget {
  const DataBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(EmployessProfile.route);
      },
      child: VStack(
        crossAlignment: CrossAxisAlignment.stretch,
        [
          const HStack(
            [
              UserInfo(
                isExpanded: false,
                  name: 'Evan Yates',
                  role: 'evanyates@gmail.com',
                  avatar: dp1png),
              Spacer(),
              Icon(Icons.more_vert_sharp)
            ],
            crossAlignment: CrossAxisAlignment.start,
          ),
          const Divider(),
          HStack(
            [
              _infoBox(label: 'Gender', datum: 'Male'),
              const Spacer(),
              _infoBox(label: 'Birthday', datum: 'Aprile 23, 1995'),
              const Spacer(),
              _infoBox(label: 'Full age', datum: '25'),
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
          _infoBox(
              label: 'Position',
              datum: 'UI/UX Designer',
              isbox: true,
              level: 'Middle')
        ],
        alignment: MainAxisAlignment.spaceAround,
      )
          .box
          .white
          .roundedLg
          // .shadow
          .p16
          .margin(const EdgeInsets.symmetric(horizontal: 20, vertical: 12))
          .height(250)
          .make(),
    );
  }

  Widget _infoBox(
      {required String label,
      required String datum,
      String? level,
      bool isbox = false}) {
    return VStack(
      [
        label.text.size(14).color(AppColors.textGrey1).make(),
        HStack([
          datum.text.size(16).color(AppColors.black).make(),
          if (isbox)
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.textGrey1),
                ),
                child: level?.text.color(AppColors.textGrey1).makeCentered())
        ]),
      ],
      crossAlignment: CrossAxisAlignment.start,
    );
  }
}
