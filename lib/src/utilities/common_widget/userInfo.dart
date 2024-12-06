import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String role;
  final String avatar;

  const UserInfo({
    super.key,
    required this.name,
    required this.role,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(avatar),
        ),
        10.widthBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name.text.textStyle(AppTextStyle.boldText(size: 16)).make(),
              role.text
                  .textStyle(AppTextStyle.regularText(
                      size: 14, color: AppColors.textGrey2))
                  .make(),
            ],
          ),
        ),
      ],
    );
  }
}
