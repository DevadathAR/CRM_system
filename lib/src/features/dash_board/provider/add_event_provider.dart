import 'package:flutter/material.dart';

class RepeatEventProvider with ChangeNotifier {
  bool _isRepeatEvent = false; // Flag to track if the event should repeat
  bool _isRepeatEveryDay = false; // Flag for 'Repeat Every Day' option
  List<String> _selectedDays = []; // List to track selected days (e.g., ['Mon', 'Tue'])
  String? _selectedDuration; // Single selected duration

  // Getter for repeat event status
  bool get isRepeatEvent => _isRepeatEvent;

  // Getter for 'Repeat Every Day' status
  bool get isRepeatEveryDay => _isRepeatEveryDay;

  // Getter for selected days
  List<String> get selectedDays => _selectedDays;

  // Getter for selected duration
  String? get selectedDuration => _selectedDuration;

  // Method to toggle the repeat event
  void toggleRepeatEvent(bool value) {
    _isRepeatEvent = value;
    if (!_isRepeatEvent) {
      _selectedDays.clear(); // Clear selected days when repeat event is turned off
      _selectedDuration = null; // Clear selected duration
    }
    notifyListeners(); // Notify listeners about the state change
  }

  // Method to toggle 'Repeat Every Day' option
  void toggleRepeatEveryDay(bool value) {
    _isRepeatEveryDay = value;
    if (_isRepeatEveryDay) {
      _selectedDays.clear(); // Clear selected days when 'Repeat Every Day' is selected
      _selectedDays.addAll(['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']);
    }
    notifyListeners();
  }

  // Method to toggle day selection
  void toggleDaySelection(String day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day); // If the day is already selected, remove it
    } else {
      _selectedDays.add(day); // If the day is not selected, add it
    }
    notifyListeners();
  }

  // Method to set the selected duration
  void selectDuration(String duration) {
    _selectedDuration = duration; // Set the selected duration
    notifyListeners(); // Notify listeners about the change
  }
}
