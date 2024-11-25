import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class IconBox extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color? iconColor;
  final VoidCallback? ontap;

  const IconBox({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    this.iconColor,  this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      // Uncomment if you need to apply the iconColor
      // colorFilter: ColorFilter.mode(iconColor ?? AppColors.black, BlendMode.srcIn),
    )
        .box
        
        .p8
        .withRounded(value: 14)
        .color(backgroundColor)
        .make()
        .onInkTap(ontap);
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