import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custum_text_feild.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
            child: TextInputField(
          isDropDown: true,
          dropDownOptions: ['Current Project', 'Project A'],
        )),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(16),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: AppColors.white),
          child: SvgPicture.asset(
            filterIconSvg,
            height: 5,
          ),
        ),
      ],
    );
  }
}
