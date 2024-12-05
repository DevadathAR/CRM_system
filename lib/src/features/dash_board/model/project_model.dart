// Sample Project Model
import 'package:crm_system/src/utilities/image_path.dart';

class Project {
  final String projectId;
  final String projectName;
  final String creationDate;
  final String priority;
  final int allTasks;
  final int activeTasks;
  final String projectIcon;

  Project({
    required this.projectId,
    required this.projectName,
    required this.creationDate,
    required this.priority,
    required this.allTasks,
    required this.activeTasks,
    required this.projectIcon,
  });
}

// Sample project data
final List<Project> projects = [
  Project(
    projectId: "PN0001265",
    projectName: "Medical App (iOS native)",
    creationDate: "Created Sep 12, 2020",
    priority: "Medium",
    allTasks: 34,
    activeTasks: 13,
    projectIcon: projectAvatar3,
  ),
  Project(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 15, 2020",
    priority: "Low",
    allTasks: 45,
    activeTasks: 20,
    projectIcon: projectavtar1,
  ),
  Project(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 15, 2020",
    priority: "Low",
    allTasks: 45,
    activeTasks: 20,
    projectIcon: projectAvatar2,
  ),
  Project(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 15, 2020",
    priority: "Low",
    allTasks: 45,
    activeTasks: 20,
    projectIcon: projectavtar1,
  ),
  // Add more projects here
];
