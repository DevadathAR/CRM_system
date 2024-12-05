import 'package:flutter/material.dart';

class VacationProvider with ChangeNotifier {
  String _selectedRequestType = 'Vacation'; // Default value is 'Vacation'

  String get selectedRequestType => _selectedRequestType;

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }

  // Set the selected request type
  void setRequestType(String value) {
    _selectedRequestType = value;
    notifyListeners(); // Notify listeners when the value changes
  }
}

