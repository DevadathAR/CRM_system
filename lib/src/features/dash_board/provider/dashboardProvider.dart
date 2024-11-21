import 'package:flutter/material.dart';

class DashbordProvider extends ChangeNotifier {
  String _selectedPath = 'Dashboard'; // Default selected page

  String get selectedPath => _selectedPath;

  void selectPath(String path) {
    _selectedPath = path;
    notifyListeners(); // Notify listeners of state changes
  }
}
