import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthTopSide extends StatelessWidget {
  const AuthTopSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VxBox().height(54).make(),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(logoSvg),
            Text(
              workroom,
              style: AppTextStyle.boldText(size: 20, color: AppColors.blue),
            ).box.px16.make()
          ],
        ).box.padding(const EdgeInsets.only(bottom: 37)).make(),
      ],
    );
  }
}