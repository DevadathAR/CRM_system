import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaginationView extends StatelessWidget {
  const PaginationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,

      margin: EdgeInsets.symmetric(horizontal: 90,vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: AppColors.textGrey1,blurRadius: 6,offset: Offset(0, 1))],
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '1-8 of 28',
            style: AppTextStyle.regularText(size: 16),
          ),
          SvgPicture.asset(
            arrowBackSvg,
            colorFilter: ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            arrowForwardSvg,
            colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
          )
        ],
      ),
    );
  }
}
