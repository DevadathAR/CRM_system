import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';

class ProjectsProvider extends ChangeNotifier {
  int progress;
  String status;

  ProjectsProvider({this.progress = 0, this.status = 'todo'});

  void updateProgress(int newProgress) {
    progress = newProgress;
    notifyListeners();
  }

  void updateStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
