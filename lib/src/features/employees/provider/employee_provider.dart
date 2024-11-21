import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
