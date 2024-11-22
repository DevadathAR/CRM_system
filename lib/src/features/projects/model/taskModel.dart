import 'package:crm_system/src/utilities/image_path.dart';

class Task {
  final int progress;
  final String taskName;
  final String estimate;
  final String spentTime;
  final String assigneeImageUrl;
  final String priority;
  final String status;

  Task({
    required this.progress,
    required this.taskName,
    required this.estimate,
    required this.spentTime,
    required this.assigneeImageUrl,
    required this.priority,
    required this.status,
  });
}

List<Task> mockTasks = [
  Task(
    progress: 6,
    taskName: "Research",
    estimate: "2d 4h",
    spentTime: "1d 2h",
    assigneeImageUrl: dp1png, // Replace with actual image URL
    priority: "Medium",
    status: "Done",
  ),
  Task(
    progress: 4,
    taskName: "Development",
    estimate: "3d 0h",
    spentTime: "1d 6h",
    assigneeImageUrl: dp2png, // Replace with actual image URL
    priority: "Low",
    status: "in Progress",
  ),
  Task(
    progress: 2,
    taskName: "Testing",
    estimate: "1d 2h",
    spentTime: "0d 4h",
    assigneeImageUrl: dp3png, // Replace with actual image URL
    priority: "High",
    status: "ToDo",
  ),
  Task(
    progress: 2,
    taskName: "Testing",
    estimate: "1d 2h",
    spentTime: "0d 4h",
    assigneeImageUrl: dp1png, // Replace with actual image URL
    priority: "Medium",
    status: "in review",
  ),
  // Add more tasks as needed
];
