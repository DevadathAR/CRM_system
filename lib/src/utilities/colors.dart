import 'package:flutter/material.dart';

class AppColors {
  static Color bgWhite = const Color(0xFFF4F9FF);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color blue = const Color(0xFF3F8CFF);
  static Color shadowGrey = const Color(0x1AC4CBD6);

  static Color lightblack = const Color(0xFF0A1629);
  static Color primaryBackGround = const Color(0xFFF4F9FD);
  static Color dividergrey = const Color(0xFFE4E6E8);
  static Color textGrey1 = const Color(0xFF7D8592);
  static Color textGrey2 = const Color(0xFF91929E);
  static Color borderGrey = const Color(0xFFD8E0F0);
  static Color backgroindGrey1 = const Color(0xFFE6EDF5);
  static Color yellow = const Color(0xFFFFBD21);
  static Color lightgreen = const Color(0xFFE0F9F2);
  static Color rose = const Color(0xFFCF18E6);
  static Color lightpurple = const Color(0x196D5DD3);
  static Color purple = const Color(0xFF6D5DD3);
  static Color cyan = const Color(0xFF15C0E6);
  static Color lightCyan = const Color(0x1A15C0E6);
  static Color togglegrey = const Color(0xFFCED5E0);
  static Color calendarColor= const Color(0xFF00BFEC);
  

  static Color green = const Color(0xFF00D097);

  static Map<String, Color> getStatusColors(String status) {
    switch (status.toLowerCase()) {
      case 'done':
        return {
          'background': AppColors.lightgreen,
          'text': AppColors.green,
        };
      case 'in progress':
        return {
          'background': AppColors.blue.withOpacity(0.2),
          'text': AppColors.blue,
        };
      case 'todo':
        return {
          'background': AppColors.textGrey1.withOpacity(0.4),
          'text': AppColors.textGrey1,
        };
      case 'in review':
        return {
          'background': AppColors.rose.withOpacity(0.4),
          'text': AppColors.rose,
        };
      default:
        return {
          'background': AppColors.textGrey1,
          'text': AppColors.textGrey2,
        };
    }
  }
}
