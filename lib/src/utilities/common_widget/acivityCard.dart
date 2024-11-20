import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class ActivityCard extends StatelessWidget {
  final VoidCallback onViewMoreTap;
  const ActivityCard({super.key, required this.onViewMoreTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Activity Stream"
              .text
              .textStyle(AppTextStyle.boldText(size: 22))
              .make(),
          10.heightBox,
          const UserInfo(
            name: "Oscar Holloway",
            role: "UI/UX Designer",
            avatar: dp2png,
          ),
          10.heightBox,
          const ActivityItem(
            icon: updateIconSvg,
            description: "Updated the status of Mind Map task to In Progress",
          ),
          10.heightBox,
          const ActivityItem(
            icon: attachIconSvg,
            description: "Attached files to the task",
          ),
          10.heightBox,
          const UserInfo(
            name: "Emily Tyler",
            role: "Copy Writer",
            avatar: dp3png,
          ),
          const ActivityItem(
            icon: updateIconSvg,
            description: "Updated the status of Mind Map task to In Progress",
          ),
           CustumIconButton(
            onTap: onViewMoreTap,
            buttonTItle: "View more",
            icon: Icons.keyboard_arrow_down,
          )
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String icon;
  final String description;

  const ActivityItem({
    super.key,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.backgroindGrey2,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
          ),
          15.widthBox,
          Expanded(
            child: description.text
                .maxLines(2)
                .overflow(TextOverflow.ellipsis)
                .textStyle(AppTextStyle.regularText(size: 16))
                .make(),
          ),
        ],
      ),
    );
  }
}
