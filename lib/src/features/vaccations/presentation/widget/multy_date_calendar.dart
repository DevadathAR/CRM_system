import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MultipleDatePickerProvider with ChangeNotifier {
  Set<DateTime> selectedDates = {}; // Set of selected dates

  // Toggle selection of a date
  void toggleDate(DateTime date) {
    if (selectedDates.contains(date)) {
      selectedDates.remove(date);
    } else {
      selectedDates.add(date);
    }
    notifyListeners();
  }
}

class MultyDateCalendar extends StatefulWidget {

  final DateTime initialDate;
  final bool allowMultipleDates;

  MultyDateCalendar({Key? key, required this.initialDate, this.allowMultipleDates = false})
      : super(key: key);

  @override
  _MultyDateCalendarState createState() => _MultyDateCalendarState();
}

class _MultyDateCalendarState extends State<MultyDateCalendar> {
  late DateTime initialDate;

  @override
  void initState() {
    super.initState();
    initialDate = widget.initialDate; // Set the initial date
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MultipleDatePickerProvider>(context);

    // Calculate the first day of the current month
    DateTime firstDayOfMonth = DateTime(initialDate.year, initialDate.month, 1);

    // Get the total days in the month
    int totalDaysInMonth =
        DateTime(initialDate.year, initialDate.month + 1, 0).day;

    // Get the starting day of the month (day of the week for the 1st)
    int startDayOfWeek = firstDayOfMonth.weekday;

    // Calculate how many weeks (rows) we need to display
    int totalWeeks = (totalDaysInMonth + startDayOfWeek - 1) ~/ 7 + 1;

    // Create a list of days to display on the calendar
    List<Widget> days = [];
    int currentDay = 1;

    // Add empty containers for the days before the first day of the month
    for (int i = 0; i < startDayOfWeek - 1; i++) {
      days.add(const SizedBox());
    }

    // Add the days of the month
    for (int i = startDayOfWeek - 1; i < 7; i++) {
      days.add(_buildDay(context, currentDay++, provider));
      if (currentDay > totalDaysInMonth) break;
    }

    // Add the rest of the days
    while (currentDay <= totalDaysInMonth) {
      for (int i = 0; i < 7; i++) {
        if (currentDay > totalDaysInMonth) break;
        days.add(_buildDay(context, currentDay++, provider));
      }
    }

    List<String> weak = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Calculate dynamic height for the calendar based on the number of weeks
    double calendarHeight = totalWeeks * 50.0; // 50.0 is the height of each row (day)

    return Container(
      height: calendarHeight + 120.0, // Add extra height for header and navigation
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left arrow for previous month
                IconButton(
                  icon: SvgPicture.asset(arrowBackSvg),
                  onPressed: () {
                    // Navigate to the previous month
                    _navigateToPreviousMonth();
                  },
                ),
                // Display current month and year
                Text(
                  DateFormat('MMMM yyyy').format(initialDate),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Right arrow for next month
                IconButton(
                  icon: SvgPicture.asset(
                    arrowForwardSvg,
                    colorFilter:
                        ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                  ),
                  onPressed: () {
                    // Navigate to the next month
                    _navigateToNextMonth();
                  },
                ),
              ],
            ),
          ),
          // Row for the days of the week (Mon-Sun)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var days in weak) _weakdays(label: days),
              ],
            ),
          ),
          // Grid for the calendar days
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 7,
              children: days,
            ),
          ),
        ],
      ),
    );
  }

  Container _weakdays({label}) {
    return Container(
        height: 30,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: AppColors.togglegrey.withOpacity(0.3)),
        child: Center(
            child: Text(label,
                style: AppTextStyle.semiboldText(
                    size: 14, color: AppColors.textGrey1))));
  }

  // Function to navigate to the previous month
  void _navigateToPreviousMonth() {
    setState(() {
      initialDate =
          DateTime(initialDate.year, initialDate.month - 1, initialDate.day);
    });
  }

  // Function to navigate to the next month
  void _navigateToNextMonth() {
    setState(() {
      initialDate =
          DateTime(initialDate.year, initialDate.month + 1, initialDate.day);
    });
  }

  // Function to build each day of the calendar
  Widget _buildDay(
    BuildContext context, int day, MultipleDatePickerProvider provider) {
    DateTime dayDate = DateTime(initialDate.year, initialDate.month, day);

    bool isSelected = provider.selectedDates.contains(dayDate);
    bool isToday = dayDate.year == DateTime.now().year &&
        dayDate.month == DateTime.now().month &&
        dayDate.day == DateTime.now().day;

    return GestureDetector(
      onTap: () {
        // Toggle the selection of the date
        provider.toggleDate(dayDate);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: isSelected ? AppColors.calendarColor : Colors.transparent,
          border: isToday
              ? Border.all(color: AppColors.textGrey1, width: 1) // White border for today
              : Border.all(color: Colors.transparent), // No border for other days
        ),
        child: Text(
          '$day',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
