import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class CalanderPage extends StatefulWidget {
  static const route = 'calander_page';

  const CalanderPage({super.key});

  @override
  State<CalanderPage> createState() => _CalanderPageState();
}

class _CalanderPageState extends State<CalanderPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Map<String, dynamic>>> _events = {
    DateTime(2024, 12, 1): [
      {'event': 'Marc\'s Birthday', 'color': Colors.red},
      {'event': 'Team Presentation', 'color': Colors.green},
      {'event': 'Marc\'s Birthday', 'color': Colors.red},
      {'event': 'Team Presentation', 'color': Colors.yellow.shade50},
      {'event': 'Marc\'s Birthday', 'color': Colors.red.shade100},
      {'event': 'Team Presentation', 'color': Colors.green.shade100},
      {'event': 'Marc\'s Birthday', 'color': Colors.pink.shade100},
      {
        'event': 'Team Presentation',
        'color': const Color.fromARGB(255, 78, 125, 80)
      },
    ],
    DateTime(2024, 12, 3): [
      {'event': 'Movie Night: Tenet', 'color': Colors.purple},
      {'event': 'Family Dinner', 'color': Colors.orange},
    ],
    DateTime(2024, 12, 10): [
      {'event': 'Conference Meeting', 'color': Colors.blue},
      {'event': 'Lunch with Team', 'color': Colors.yellow},
    ],
    DateTime(2024, 12, 15): [
      {'event': 'Gym Session', 'color': Colors.teal},
      {'event': 'Doctor Appointment', 'color': Colors.pink},
    ],
  }.map(
    (key, value) => MapEntry(DateTime(key.year, key.month, key.day), value),
  );

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    final normalizedDay =
        DateTime(day.year, day.month, day.day); // Normalize date
    return _events[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: ListView(
          children: [
            20.heightBox,
            "Calendar"
                .text
                .textStyle(AppTextStyle.boldText(size: 36)) 
                .make()
                .pSymmetric(h: 8),
            10.heightBox,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: AppTextStyle.boldText(
                          size: 16, color: AppColors.lightblack),
                      leftChevronIcon: SvgPicture.asset(arrowBackSvg),
                      rightChevronIcon: SvgPicture.asset(
                        arrowForwardSvg,
                        colorFilter:
                            ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                      ),
                      leftChevronMargin: const EdgeInsets.only(left: 35.0),
                      rightChevronMargin: const EdgeInsets.only(right: 35.0),
                    ),
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blueAccent, width: 1), // Add border
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)), // Rounded corners
                        color: Colors.transparent, // No fill color
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColors
                            .lightblack, // Ensure the text color is visible
                        fontWeight: FontWeight.bold,
                      ),
                      selectedDecoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.purple, width: 1), // Add border
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)), // Rounded corners
                        color: Colors.transparent, //
                      ),
                      selectedTextStyle: TextStyle(
                        color: AppColors.lightblack,
                      ),
                      markersAutoAligned: true,

                      // markersAlignment:
                      //     Alignment.bottomCenter, // Position dots under date
                      // markerDecoration: const BoxDecoration(
                      //   color: Colors.blue,
                      //   shape: BoxShape.circle,
                      // ),
                    ),
                    // eventLoader: _getEventsForDay,

                    eventLoader: (day) {
                      final eventsForDay = _getEventsForDay(day);
                      List<Widget> markers = [];

                      // Loop through all events for the selected day
                      for (int i = 0; i < eventsForDay.length; i++) {
                        final event = eventsForDay[i];

                        // For more than 3 events, overlap markers
                        double overlapOffset =
                            i * 5.0; // You can adjust the overlap space

                        markers.add(
                          Positioned(
                            bottom:
                                overlapOffset, // Stack markers with overlap if more than 3 events
                            left: 2.0,
                            child: Container(
                              width: 6.0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                color: event[
                                    'color'], // Use the event's color for the marker
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      }

                      return markers; // Return the list of markers
                    },
                  ),
                  const Divider(color: Colors.grey),
                  20.heightBox,
                  Column(
                    children: [
                      Text('September 18,2024',
                          style: AppTextStyle.boldText(
                              size: 16, color: AppColors.black)),
                      10.heightBox,
                      _selectedDay != null &&
                              _getEventsForDay(_selectedDay!).isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _getEventsForDay(_selectedDay!).length,
                              itemBuilder: (context, index) {
                                var event = _getEventsForDay(
                                    _selectedDay!)[index]; // Fetch event map

                                return eventsWidget(
                                  eventTitle: event['event'],
                                  time:
                                      "${(index + 1) * 2}h", // Mock time, e.g., "2h", "4h"
                                  icon: arrowDownSvg, // Example icon
                                  color: event['color'], // Example color
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                "No events for this day",
                                style: AppTextStyle.regularText(size: 14),
                              ),
                            ),
                    ],
                  ).pSymmetric(h: 20),
                ],
              ),
            ),
          ],
        ).pSymmetric(h: 20),
      ),
    );
  }

  Widget eventsWidget({
    required String eventTitle,
    required String time,
    required Color color, // Ensure color is passed here
    required String icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.primaryBackGround,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Aligns children at the top
        children: [
          // Colored line
          Container(
            height: 50,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: color, // Apply the event color here
            ),
          ),
          10.widthBox,
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                eventTitle.text
                    .textStyle(AppTextStyle.boldText(
                        size: 14, color: AppColors.lightblack))
                    .make(),
                Row(
                  children: [
                    time.text
                        .textStyle(AppTextStyle.boldText(
                            size: 12, color: AppColors.textGrey1))
                        .make(),
                    8.widthBox,
                    SvgPicture.asset(icon),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
