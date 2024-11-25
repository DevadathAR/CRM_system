import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class IconBox extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color? iconColor;
  final double vp;
  final double hp;

  const IconBox({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.iconColor,
    this.vp = 8,
    this.hp = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      // Uncomment if you need to apply the iconColor
      // colorFilter: ColorFilter.mode(iconColor ?? AppColors.black, BlendMode.srcIn),
    )
        .box
        .padding(EdgeInsets.symmetric(vertical: vp, horizontal: hp))
        .withRounded(value: 14)
        .color(backgroundColor)
        .make();
  }
}



// Widget iconBox({
//     required String icon,
//     required Color backgroundColor,
//     Color? iconColor,
//   }) {
//     return SvgPicture.asset(
//       icon,
//       // colorFilter:
//       //     ColorFilter.mode(iconColor ?? AppColors.black, BlendMode.srcIn),
//     ).box.p8.withRounded(value: 14).color(backgroundColor).make();
//   }