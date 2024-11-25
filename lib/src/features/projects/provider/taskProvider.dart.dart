import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  int progress;
  String status;

  TaskProvider({this.progress = 0, this.status = 'todo'});

  void updateProgress(int newProgress) {
    progress = newProgress;
    notifyListeners();
  }

  void updateStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

 }
