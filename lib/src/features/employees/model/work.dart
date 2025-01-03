import 'package:crm_system/src/utilities/const.dart';

class EmployeeData {
  final String name;
  final String email;
  final String avatar;
  final String gender;
  final String dob;
  final int age;
  final String position;
  final String level;
  final String backlog;  // Add these fields
  final String taskProgress;
  final String taskReview;

  EmployeeData({
    required this.name,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.dob,
    required this.age,
    required this.position,
    required this.level,
    required this.backlog,  // Add these fields
    required this.taskProgress,
    required this.taskReview,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    try {
      return EmployeeData(
        name: json['user']['name'] ?? 'N/A',
        email: json['user']['email'] ?? 'N/A',
        avatar: json['user']['userImage'] ?? dp1png,  // Default avatar image
        gender: json['gender'] ?? 'N/A',
        dob: json['dob'] ?? 'N/A',
        age: json['age'] ?? 0,
        position: json['postition'] ?? 'N/A',
        level: json['level'] ?? 'N/A',
        backlog: json['backlog_tasks'] ?? '0',  // Ensure these fields exist in the API response
        taskProgress: json['in_progress'] ?? '0',
        taskReview: json['in_review'] ?? '0',
      );
    } catch (e) {
      throw Exception('Error parsing employee data: $e');
    }
  }
}
class EmployeeResponse {
  final List<EmployeeData> employees;
  final int totalCount;

  EmployeeResponse({
    required this.employees,
    required this.totalCount,
  });
}
