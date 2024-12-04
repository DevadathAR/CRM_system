import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
    ).pSymmetric(h: 16);
  }