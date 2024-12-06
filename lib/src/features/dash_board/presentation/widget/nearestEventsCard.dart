import 'package:crm_system/src/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:crm_system/src/utilities/image_path.dart';

class NearestEventsCard extends StatelessWidget {
  final bool isnearestEvents;
  final Map<String, dynamic> event;

  const NearestEventsCard({
    super.key,
    required this.event,
    required this.isnearestEvents,
  });

  @override
  Widget build(BuildContext context) {
    final String progress = event['progress'];

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 4, vertical: 8), // Spacing between cards
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns children at the top
        children: [
          !isnearestEvents
              ? // Blue Line
              Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.blue,
                  ),
                )
              : SvgPicture.asset(event['icon']),
          10.widthBox,
          // Event Details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // CrossAxisAlignment.start, // Align text to the start
              children: [
                // Event Title and Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Expanded(
                      child: event['title']
                          .toString()
                          .text
                          .maxLines(2)
                          .overflow(TextOverflow.ellipsis)
                          .textStyle(AppTextStyle.boldText(size: 16))
                          .make(),
                    ),
                    // Icon

                    SvgPicture.asset(
                      progress == low
                          ? arrowDownSvg
                          : arrowUpSvg, // Example icon path
                      height: 16,
                    ),
                  ],
                ),
                10.heightBox,
                // const Spacer(),
                // Event Date, Time, and Duration
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date and Time
                      "${event['date']} | ${event['time']}"
                          .text
                          .textStyle(AppTextStyle.regularText(
                            size: 14,
                            color: AppColors.textGrey2,
                          ))
                          .make(),
                      // Duration
                      Row(
                        children: [
                          SvgPicture.asset(
                            clockSvg, // Example clock icon path
                            height: 14,
                          ),
                          5.widthBox,
                          "${event['duration']}h"
                              .text
                              .textStyle(AppTextStyle.boldText(
                                size: 12,
                                color: AppColors.textGrey1,
                              ))
                              .make(),
                        ],
                      )
                          .box
                          .p8
                          .withRounded(value: 8.0)
                          .color(AppColors.primaryBackGround)
                          .make(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
