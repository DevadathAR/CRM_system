import 'package:crm_system/src/features/dash_board/provider/add_event_provider.dart';
import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/grey_title.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key});

  List<String> duration = ['Daily', 'Weekly', 'Monthly'];
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0,bottom: 30),
      child: Dialog(
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Add Event"
                    .text
                    .textStyle(AppTextStyle.boldText(size: 22))
                    .make(),
                SvgPicture.asset(
                  closeIconSvg,
                  colorFilter:
                      ColorFilter.mode(AppColors.lightblack, BlendMode.srcIn),
                  height: 18,
                  width: 18,
                ).onTap(() => Navigator.pop(context)), // Close button
              ],
            ),
            8.heightBox,
            greyTitle(text: "Event Name"),
            8.heightBox,
            const TextInputField(
              hintText: "Kattie's Birthday",
            ),
            8.heightBox,
            greyTitle(text: "Task Group"),
            8.heightBox,
            const TextInputField(
              isDropDown: true,
              dropDownOptions: ['1', '2', '3'],
              hintText: "Corporate Event",
            ),
            8.heightBox,
            greyTitle(text: "Priority"),
            8.heightBox,
            const TextInputField(
              isDropDown: true,
              dropDownOptions: ['High', 'Medium', 'Low'],
              hintText: "Priority",
            ),
            8.heightBox,
            greyTitle(text: "Date"),
            8.heightBox,
            const CustomDateTimePicker(iconName: calenderSvg,
              hintText: 'Select Date',),
            8.heightBox,
            greyTitle(text: "Time"),
            8.heightBox,
            
            const CustomDateTimePicker(iconName: clocNakedkSvg,
              hintText: 'Select Time',),
           
            8.heightBox,
            greyTitle(text: "Description"),
            8.heightBox,
            const TextInputField(
              height: 150,
              maxlines: 4,
              hintText: "Add some description of the event",
            ),
            8.heightBox,
            // Repeat Event Section with Toggle
            Consumer<RepeatEventProvider>(
              builder: (context, repeatEventProvider, child) {
                return Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          color: AppColors.primaryBackGround),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repeat Event',
                            style: AppTextStyle.semiboldText(
                                size: 16, color: AppColors.black),
                          ),
                          Switch(
                            value: repeatEventProvider.isRepeatEvent,
                            onChanged: (bool value) {
                              repeatEventProvider.toggleRepeatEvent(
                                  value); // Use provider to update state
                            },
                            activeColor: AppColors.blue,
                            inactiveTrackColor: AppColors.togglegrey,
                          ),
                        ],
                      ),
                    ),
                    if (repeatEventProvider.isRepeatEvent) ...[
                      greyTitle(text: 'Select Duration'),
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var item in duration)
                            _selectionBox(
                              label: item,
                              isSelected:
                                  repeatEventProvider.selectedDuration == item,
                              onTap: () {
                                repeatEventProvider.selectDuration(
                                    item); // Update selected duration
                              },
                            ),
                        ],
                      ),
                      if (repeatEventProvider.selectedDuration == 'Weekly') ...[
                        greyTitle(text: 'On this day'),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            for (var item in days)
                              _selectionBox(
                                label: item,
                                isSelected: repeatEventProvider.selectedDays
                                    .contains(item),
                                onTap: () {
                                  repeatEventProvider.toggleDaySelection(
                                      item); // Update selected day
                                },
                              ),
                          ],
                        ),
                        Row(
                        children: [
                          Checkbox(
                            value: repeatEventProvider.isRepeatEveryDay,
                            onChanged: (bool? value) {
                              repeatEventProvider
                                  .toggleRepeatEveryDay(value ?? false);
                            },
                          ),
                          Text(
                            'Repeat every day',
                            style: AppTextStyle.regularText(
                                size: 14, color: AppColors.black),
                          ),
                        ],
                      ),
                      ],
                      
                    ]
                  ],
                );
              }, 
            ),

            8.heightBox,
            greyTitle(text: "Time"),
            8.heightBox,
            const TextInputField(
              viewIcon: true,
              iconName: clocNakedkSvg,
              hintText: 'Select Time',
            ),
            16.heightBox,
            PrimaryBlueButton(
                title: 'Save Event',
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ).p20(),
      ),
    );
  }

  Widget _selectionBox(
      {double height = 50,
      double width = 85,
      required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? AppColors.blue : AppColors.textGrey1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isSelected
            ? AppColors.blue
            : AppColors.white, // Change color if selected
      ),
      child: Center(
        child: Text(
          label,
          style: isSelected
              ? AppTextStyle.semiboldText(size: 14, color: AppColors.white)
              : AppTextStyle.regularText(
                  size: 14,
                  color: AppColors.textGrey1), // Change text color if selected
        ),
      ),
    ).onTap(onTap); // Call the onTap to update the selection
  }

  Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
    );
  }
}
