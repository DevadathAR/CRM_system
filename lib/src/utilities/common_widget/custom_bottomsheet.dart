import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    String? title,
    Widget? content,
    List<Widget>? actions,
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: isScrollControlled,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Draggable Handle
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Vx.gray300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Title
              if (title != null)
                title.text
                    .textStyle(AppTextStyle.boldText(
                        size: 18, color: AppColors.lightblack))
                    .make()
                    .pOnly(bottom: 16),

              // Content
              if (content != null) content,
              if (content != null) 16.heightBox,

              // Actions
              if (actions != null)
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  children: actions,
                ),
            ],
          ),
        );
      },
    );
  }
}
