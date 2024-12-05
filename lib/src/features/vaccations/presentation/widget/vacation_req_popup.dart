import 'dart:developer';

import 'package:crm_system/src/features/vaccations/presentation/widget/multy_date_calendar.dart';
import 'package:crm_system/src/features/profile/presentation/widget/calander_pop_screen.dart';
import 'package:crm_system/src/features/vaccations/provider/vacation_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/primaryBlueButton.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart'; // Import provider

class VacationRequest extends StatelessWidget {
  VacationRequest({super.key});
  final List<String> titles = ['Days', 'Hours'];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Get the selected request type from the provider
    final selectedRequestType =
        Provider.of<VacationProvider>(context).selectedRequestType;

    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Add Request"
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
            greyTitle(text: "Request Type"),
            8.heightBox,

            // Reuse the method for each radio button
            _buildRadioButton(context, 'Vacation', selectedRequestType),
            _buildRadioButton(context, 'Sick Leave', selectedRequestType),
            _buildRadioButton(context, 'Work Remotely', selectedRequestType),
            Consumer<VacationProvider>(
              builder: (context, provider, child) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: AppColors.textGrey1.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          provider.setPage(index);
                          _pageController
                              .jumpToPage(index); // Sync with PageController
                        },
                        child: _pageTitle(context, provider, index),
                      );
                    }),
                  ),
                );
              },
            ),
            const Divider(),
            MultyDateCalendar(initialDate: DateTime.now()),
            const Divider(),

            // PageView with correct page syncing
            Consumer<VacationProvider>(
              builder: (context, provider, child) {
                double pageHeight;
                if (provider.currentPage == 0) {
                  pageHeight = 0; // Height for index 0 (Days content)
                } else if (provider.currentPage == 1) {
                  pageHeight = 290; // Height for index 1 (Hours content)
                } else {
                  pageHeight =
                      100; // Default height for other pages, you can adjust this
                }
                return SizedBox(
                  height: pageHeight,
                  child: PageView(
                    controller: _pageController, // Connect PageController
                    onPageChanged: (index) {
                      provider.setPage(index); // Update Provider on swipe
                    },
                    children: [
                      const SizedBox.shrink(), // Placeholder for Days content
                      _hoursContent(), // Placeholder for Hours content
                    ],
                  ),
                );
              },
            ),

            Row(
              children: [
                SvgPicture.asset(chatSvg),
                16.widthBox,
                Expanded(
                    child: PrimaryBlueButton(
                        title: 'Send Request',
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            )
          ],
        ).p20(),
      ),
    );
  }

  Widget _hoursContent() {
    DateTime? fromTime;
    DateTime? toTime;

    // Function to calculate the time difference
    String calculateTimeGap() {
      if (fromTime != null && toTime != null) {
        final difference = toTime!.difference(fromTime!);
        final hours = difference.inHours;
        final minutes = difference.inMinutes % 60;
        log('$hours hours and $minutes minutes');
        return '$hours hours and $minutes minutes';
      }
      return 'Select both times'; // Default text if either time is not selected
    }

    return ListView(physics: const NeverScrollableScrollPhysics(), children: [
      greyTitle(text: 'From'),
      CustomDateTimePicker(
        iconName: clocNakedkSvg,
        onDateSelected: (dateTime) {
          fromTime = dateTime; // Save the selected 'From' time
        },
      ),
      8.heightBox,
      greyTitle(text: 'To'),
      CustomDateTimePicker(
        iconName: clocNakedkSvg,
        onDateSelected: (dateTime) {
          toTime = dateTime; // Save the selected 'To' time
        },
      ),
      8.heightBox,
      // Display the calculated time gap
      Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            color: AppColors.primaryBackGround),
        child: Center( 
          child: Text(
            'Time For Vaccation ${calculateTimeGap()}',
            style: AppTextStyle.boldText(size: 14, color: AppColors.black),
          ),
        ),
      ),
    ]);
  }

  Container _pageTitle(
      BuildContext context, VacationProvider provider, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(4),
      width: size.width * .4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color:
            provider.currentPage == index ? AppColors.blue : Colors.transparent,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          titles[index],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Common method for creating radio buttons
  Widget _buildRadioButton(
      BuildContext context, String title, String selectedRequestType) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      title: title.text.make(),
      value: title,
      groupValue: selectedRequestType,
      onChanged: (String? value) {
        if (value != null) {
          // Set the selected request type through the provider
          Provider.of<VacationProvider>(context, listen: false)
              .setRequestType(value);
        }
      },
      activeColor: AppColors.blue, // Active color for the selected radio
    );
  }

  Widget greyTitle({required String text}) {
    return Text(
      text,
      style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
    );
  }
}
