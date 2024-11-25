import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class StatusContainer extends StatelessWidget {
  final bool isDropdwn;
  final String status;
  const StatusContainer({
    super.key,
    // required this.colors,
    required this.status,
    this.isDropdwn = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.getStatusColors(status);

    return Container(
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          status.text
              .textStyle(AppTextStyle.boldText(size: 12, color: colors['text']))
              .make(),
          5.widthBox,
          SvgPicture.asset(
            dropDownIconSvg,
            colorFilter: ColorFilter.mode(colors['text']!, BlendMode.srcIn),
          )
        ],
      ),
    );
  }
}
