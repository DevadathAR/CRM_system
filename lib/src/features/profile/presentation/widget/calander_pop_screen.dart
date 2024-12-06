import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatefulWidget {
  final String? label; // Label for the input field
  final String iconName; // Icon for the calendar button
  final DateTime? initialDate; // Initial date for the picker
  final String? hintText;
  final bool isDateonly;
  final Function(DateTime)? onDateSelected; // Callback to handle selected date

  const CustomDateTimePicker({
    Key? key,
    this.label,
    required this.iconName,
    this.isDateonly = true,
    this.initialDate,
    this.onDateSelected,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // Initialize the text controller with the initial date if provided
    _textController = TextEditingController(
      text: widget.iconName == calenderSvg
          ? (_selectedDate != null
              ? _formatDateTime(_selectedDate!, _selectedTime)
              : '')
          : (_selectedTime != null ? _formatTime(_selectedTime!) : ''),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // Helper function to format the date and time as a string
  String _formatDateTime(DateTime date, TimeOfDay? time) {
    final DateFormat dateFormatter = DateFormat('MMM dd, yyyy');
    String formattedDate = dateFormatter.format(date);

    if (time != null) {
      final String formattedTime = _formatTime(time);
      return '$formattedDate $formattedTime'; // Concatenate date and time
    }
    return formattedDate; // Return only date if no time is selected
  }

  String _formatTime(TimeOfDay time) {
    final int hour = time.hour % 12; // Convert to 12-hour format
    final String hourString =
        hour == 0 ? '12' : (hour < 10 ? '0$hour' : '$hour');
    final String minuteString =
        time.minute < 10 ? '0${time.minute}' : '${time.minute}';
    final String amPm = time.hour >= 12 ? 'PM' : 'AM'; // AM or PM

    return '$hourString:$minuteString $amPm'; // Format time as 12-hour clock with AM/PM
  }

  // Function to pick the date
  Future<void> _pickDateTime(BuildContext context) async {
    // Show the date picker first
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      // Show the time picker after a date is selected
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime ?? TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue, // Header background color
                onPrimary: Colors.white, // Header text color
                onSurface: Colors.black, // Body text color
              ),
            ),
            child: child!,
          );
        },
      );

      if (selectedTime != null) {
        setState(() {
          _selectedDate = selectedDate;
          _selectedTime = selectedTime;

          // Update text field based on the icon type
          _textController.text = widget.iconName == calenderSvg
              ? _formatDateTime(selectedDate, selectedTime) // Date and time
              : _formatTime(selectedTime); // Only time
        });

        // Pass both date and time back (you can modify this if you only want to pass date)
        widget.onDateSelected?.call(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          ),
        );
      }
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
        _textController.text = widget.iconName == calenderSvg
            ? _formatDateTime(selectedDate,
                _selectedTime) // Update text field with date and time
            : _formatTime(_selectedTime ??
                TimeOfDay.now()); // Only show time if icon is not calendar
      });
      widget.onDateSelected?.call(selectedDate); // Pass the selected date back
    }
  }

  // Function to pick the time
  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
        _textController.text = widget.iconName == calenderSvg
            ? _formatDateTime(_selectedDate ?? DateTime.now(),
                selectedTime) // Update text field with date and time
            : _formatTime(selectedTime); // Update text field with time only
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: TextFormField(
        controller: _textController, // Attach controller to the text field
        readOnly: true, // Make the text field non-editable
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppColors.borderGrey),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppColors.borderGrey),
          ),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              widget.iconName,
              colorFilter:
                  ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn),
            ),
            onPressed: widget.iconName == calenderSvg
                ? widget.isDateonly
                    ? () => _pickDate(context)
                    : () => _pickDateTime(context) // Handle calendar icon
                : () => _pickTime(context), // Handle time picker icon
          ),
          hintText: widget.hintText,
          hintStyle:
              AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
        ),
      ),
    );
  }
}
