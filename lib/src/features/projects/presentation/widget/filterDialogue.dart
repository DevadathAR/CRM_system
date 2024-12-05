import 'package:crm_system/src/utilities/common_widget/customCheckBox.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/dialogue_box_title.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DialogueBoxTitle(
            title: "Filters",
          ).p16(),
          10.heightBox,
          Divider(
            color: AppColors.dividergrey,
          ),
          // Example Filter Options
          boldGreyTitle(text: "Period"),

          16.heightBox,
          const TextInputField(
            hintText: "Select Period",
            viewIcon: true,
            iconName: calenderSvg,
          ).pSymmetric(h: 16),
          16.heightBox,
          Divider(
            color: AppColors.dividergrey,
          ),
          10.heightBox,
          boldGreyTitle(text: "Task Group"),
          16.heightBox,
          Column(
            children: [
              _checkboxTile(text: "Design"),
              12.heightBox,
              _checkboxTile(text: "Development"),
              12.heightBox,
              _checkboxTile(text: "Testing"),
              12.heightBox,
              _checkboxTile(text: "Marketing"),
              12.heightBox,
              _checkboxTile(text: "Project Management"),
              12.heightBox,
            ],
          ).pSymmetric(h: 16),
          Divider(color: AppColors.dividergrey),
          10.heightBox,
          boldGreyTitle(text: "Reporter"),
          16.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imgcheckboxTile(text: "Oscar Holloway", imgUrl: dp1png),
              12.heightBox,
              _imgcheckboxTile(text: "Leonard Rodriquez", imgUrl: dp1png),
              12.heightBox,
              _imgcheckboxTile(text: "Owen Chambers", imgUrl: dp1png),
              12.heightBox,
              _imgcheckboxTile(text: "Gabriel Flowers", imgUrl: dp1png),
              12.heightBox,
              _imgcheckboxTile(text: "Violet Robbins", imgUrl: dp1png),
              12.heightBox,
              Row(
                children: [
                  CustumIconButton(
                      buttonTItle: "View more",
                      icon: dropDownIconSvg,
                      onTap: () {}),
                  const Spacer()
                ],
              )
            ],
          ).pSymmetric(h: 16),
          Divider(color: AppColors.dividergrey),
          10.heightBox,
          boldGreyTitle(text: "Assignees"),
          10.heightBox,

          const TextInputField(
            isSearch: true,
            hintText: "Search",
          ).pSymmetric(h: 16),
          16.heightBox,
          Wrap(
            runSpacing: 5,
            spacing: 5,
            children: [
              _searchResultTile(imgUrl: dp3png, text: "Violet Robbins"),
              10.heightBox,
              _searchResultTile(imgUrl: dp3png, text: "Violet Robbins"),
              10.heightBox,
              _searchResultTile(imgUrl: dp3png, text: "Violet ")
            ],
          ).pSymmetric(h: 16),
          10.heightBox,
          Divider(color: AppColors.dividergrey),
          10.heightBox,
          boldGreyTitle(text: "Estimate"),
          10.heightBox,
          const TextInputField(
            hintText: "Select duration",
            viewIcon: true,
            iconName: clocNakedkSvg,
          ).pSymmetric(h: 16),
          10.heightBox,
          Divider(color: AppColors.dividergrey),
          10.heightBox,
          boldGreyTitle(text: "Priority"),
          10.heightBox,
          // dropDOwn
          const TextInputField(
            isDropDown: true,
            dropDownOptions: ["Medium", "High", "Low"],
          ).pSymmetric(h: 16),
          10.heightBox,
          // image
          _checkboxTile(text: "10 matches found", isImage: true)
              .pSymmetric(h: 16),
          16.heightBox,
          PrimaryBlueButton(
            onPressed: () {
              Navigator.pop(context);
            },
            title: "Save filters  (3)",
          ).pSymmetric(h: 16),
          16.heightBox,
        ],
      ),
    );
  }

  Row _checkboxTile({required String text, bool isImage = false}) {
    bool isChecked = false; // Checkbox state

    return Row(children: [
      isImage
          ? SvgPicture.asset(iSvg)
          : Customcheckbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
      10.widthBox,
      text.text
          .textStyle(
              AppTextStyle.regularText(size: 16, color: AppColors.lightblack))
          .make(),
    ]);
  }

  Row _imgcheckboxTile({required String text, required String imgUrl}) {
    bool isChecked = false; // Checkbox state

    return Row(children: [
      Customcheckbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
        },
      ),
      16.widthBox,
      CircleAvatar(
        radius: 14,
        child: Image.asset(imgUrl),
      ),
      10.widthBox,
      text.text
          .textStyle(
              AppTextStyle.regularText(size: 16, color: AppColors.lightblack))
          .make(),
    ]);
  }

  Widget _searchResultTile({
    required String text,
    required String imgUrl,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35,
          width: 35,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 14,
            child: Image.asset(imgUrl).p2(),
          ),
        ),
        10.widthBox,
        text.text
            .textStyle(
                AppTextStyle.regularText(size: 12, color: AppColors.lightblack))
            .make(),
        SvgPicture.asset(roundCloseIconSvg),
      ],
    ).box.p3.color(AppColors.primaryBackGround).withRounded(value: 16).make();
  }

  Widget boldGreyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
    ).pSymmetric(h: 16);
  }
}
