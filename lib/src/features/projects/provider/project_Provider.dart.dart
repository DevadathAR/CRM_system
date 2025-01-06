import 'dart:io';

import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:file_picker/file_picker.dart';
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

  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController iconIDController = TextEditingController();
  final TextEditingController projectDiscriptionController =
      TextEditingController();
  final TextEditingController reporterController = TextEditingController();
  final TextEditingController searchAssigneesController = TextEditingController();
 
  Future<List<Map<String, dynamic>>>? usersList;
  DateTime? startDate;
  DateTime? deadline;
  List<File> selectedFiles = []; // To store the selected files

  Future<void> selectFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );
    if (result != null) {
      selectedFiles =
          result.paths.map((path) => File(path!)).toList(); // Convert to File
    }
  }
//  final TextEditingController emailController = TextEditingController();


  Future<void> handleAddProject(BuildContext context) async {
    if (startDate == null || deadline == null || selectedFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and upload files')),
      );
      return;
    }

    try {
      final response = await ApiServices().addProject(
        projectName: projectNameController.text.trim(),
        startingDate: startDate!,
        deadline: deadline!,
        priority: priorityController.text.trim(),
        reporterId: reporterController.text.trim(),
        iconID: iconIDController.text.trim(),
        projectDiscription: projectDiscriptionController.text.trim(),
        projectAssaignees: [], // Hardcoded for example
        projectLinks: ["https://new.com", "https://new.com"], // Example links
        projectAttachments: selectedFiles,
      );

      //print('Response: $response');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project Added Successfully!')),
      );
    } catch (e) {
      //print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add project: $e')),
      );
    }
  }


}






