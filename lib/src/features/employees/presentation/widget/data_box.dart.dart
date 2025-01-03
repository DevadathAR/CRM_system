import 'package:crm_system/src/features/employees/presentation/view/employess_profile.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class DataBox extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  final String gender;
  final String birthday;
  final int age;
  final String position;
  final String level;

  const DataBox({
    super.key,
    required this.name,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.birthday,
    required this.age,
    required this.position,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(EmployessProfile.route);
      },
      child: VStack(
        crossAlignment: CrossAxisAlignment.stretch,
        [
          HStack(
            [
              UserInfo(
                isExpanded: false,
                name: name,
                role: email,
                avatar: avatar,
              ),
              const Spacer(),
              const Icon(Icons.more_vert_sharp),
            ],
            crossAlignment: CrossAxisAlignment.start,
          ),
          const Divider(),
          HStack(
            [
              _infoBox(label: 'Gender', datum: gender),
              const Spacer(),
              _infoBox(label: 'Birthday', datum: birthday),
              const Spacer(),
              _infoBox(label: 'Full age', datum: '$age'),
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
          _infoBox(
            label: 'Position',
            datum: position,
            isbox: true,
            level: level,
          ),
        ],
        alignment: MainAxisAlignment.spaceAround,
      )
          .box
          .white
          .roundedLg
          .p16
          .margin(const EdgeInsets.symmetric(horizontal: 20, vertical: 12))
          .height(250)
          .make(),
    );
  }

  Widget _infoBox({
    required String label,
    required String datum,
    String? level,
    bool isbox = false,
  }) {
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
              child: level?.text.color(AppColors.textGrey1).makeCentered(),
            ),
        ]),
      ],
      crossAlignment: CrossAxisAlignment.start,
    );
  }
}
