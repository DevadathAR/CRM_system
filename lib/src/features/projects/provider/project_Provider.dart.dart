import 'dart:io';

import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// class ProjectsProvider extends ChangeNotifier {
//   int progress;
//   String status;
// DateTime? startDate;
//   DateTime? deadline;
//   List<File> selectedFiles = []; // To store the selected files
//   final ApiServices apiServices = ApiServices();
//   ProjectsProvider({this.progress = 0, this.status = 'todo'});

//   void updateProgress(int newProgress) {
//     progress = newProgress;
//     notifyListeners();
//   }

//   void updateStatus(String newStatus) {
//     status = newStatus;
//     notifyListeners();
//   }

//   final TextEditingController projectNameController = TextEditingController();
//   final TextEditingController priorityController = TextEditingController();
//   final TextEditingController iconIDController = TextEditingController();
//   final TextEditingController projectDiscriptionController =
//       TextEditingController();
//   final TextEditingController reporterController = TextEditingController();

//   final TextEditingController searchAssigneeController =
//       TextEditingController();
//   final TextEditingController searchReporterController =
//       TextEditingController();

//   List<Map<String, dynamic>> selectedAssignees = []; // Track selected assignees
//   Map<String, dynamic>? reporter; // Reporter

//   void toggleAssigneeSelection(Map<String, dynamic> assignee) {
//     if (!selectedAssignees.contains(assignee)) {
//       selectedAssignees.add(assignee);
//       searchAssigneeController.clear(); // Clear the input field
//       _users = []; // Clear search results after selection
//     } else {
//       selectedAssignees.remove(assignee); // Remove if deselected
//     }
//     notifyListeners();
//   }

//   List<Map<String, dynamic>> get projectAssignees => selectedAssignees;
//   // Set Reporter
//   void setReporter(Map<String, dynamic> selectedReporter) {
//     reporter = selectedReporter;
//     searchAssigneeController.clear(); // Clear input field
//     notifyListeners();
//   }

//   // Clear Reporter
//   void clearReporter() {
//     reporter = null;
//     notifyListeners();
//   }

//   List<Map<String, dynamic>> _users = [];
//   String? _errorMessage;
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   List<Map<String, dynamic>> get users => _users;
//   String? get errorMessage => _errorMessage;

//   Future<void> selectFiles() async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.any,
//     );
//     if (result != null) {
//       selectedFiles =
//           result.paths.map((path) => File(path!)).toList(); // Convert to File
//     }
//   }

//   Future<void> fetchUsers(String email) async {
//     if (email.isEmpty) {
//       _errorMessage = 'Please enter a valid email address.';
//       _users = [];
//       notifyListeners();
//       return;
//     }

//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       _users = await apiServices.listUsers(email: email.trim());
//       _errorMessage = _users.isEmpty ? 'No users found.' : null;
//     } catch (error) {
//       _errorMessage = error.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> handleAddProject(BuildContext context) async {
//     if (startDate == null || deadline == null || selectedFiles.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please fill all fields and upload files')),
//       );
//       return;
//     }

//     try {
//       final response = await ApiServices().addProject(
//         projectName: projectNameController.text.trim(),
//         startingDate: startDate!,
//         deadline: deadline!,
//         priority: priorityController.text.trim(),
//         reporterId: reporterController.text.trim(),
//         iconID: iconIDController.text.trim(),
//         projectDiscription: projectDiscriptionController.text.trim(),
//         projectAssaignees:
//             selectedAssignees.map((assignee) => assignee['id']).toList(),
//         projectLinks: ["https://new.com", "https://new.com"], // Example links
//         projectAttachments: selectedFiles,
//       );

//       //print('Response: $response');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Project Added Successfully!')),
//       );
//     } catch (e) {
//       //print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add project: $e')),
//       );
//     }
//   }
// }
class ProjectsProvider extends ChangeNotifier {
  // Common Fields
  int progress;
  String status;
  DateTime? startDate;
  DateTime? deadline;
  List<File> selectedFiles = [];
   List<String> _icons = [];
  List<String> get icons => _icons;

// field to store the selected icon ID
  String? _selectedIconID;
  String? get selectedIconID => _selectedIconID;

  final ApiServices apiServices = ApiServices();
  ProjectsProvider({this.progress = 0, this.status = 'todo'});
// common loading   
bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Loading States
  bool _isAssigneeLoading = false;
  bool _isReporterLoading = false;

  // Error Messages
  String? _assigneeErrorMessage;
  String? _reporterErrorMessage;

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  // User Lists
  List<Map<String, dynamic>> _assigneeUsers = [];
  List<Map<String, dynamic>> _reporterUsers = [];

  // Assignees and Reporter
  List<Map<String, dynamic>> selectedAssignees = [];
  Map<String, dynamic>? reporter;

  // Controllers
  final TextEditingController searchAssigneeController =
      TextEditingController();
  final TextEditingController searchReporterController =
      TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController iconIDController = TextEditingController();
  final TextEditingController projectDiscriptionController =
      TextEditingController();
  final TextEditingController reporterController = TextEditingController();

  // Getters for Assignees
  bool get isAssigneeLoading => _isAssigneeLoading;
  String? get assigneeErrorMessage => _assigneeErrorMessage;
  List<Map<String, dynamic>> get assigneeUsers => _assigneeUsers;

  // Getters for Reporter
  bool get isReporterLoading => _isReporterLoading;
  String? get reporterErrorMessage => _reporterErrorMessage;
  List<Map<String, dynamic>> get reporterUsers => _reporterUsers;

  // Toggle Assignee Selection
  void toggleAssigneeSelection(Map<String, dynamic> assignee) {
    if (!selectedAssignees.contains(assignee)) {
      selectedAssignees.add(assignee);
      searchAssigneeController.clear(); // Clear input field
      _assigneeUsers = []; // Clear search results after selection
    } else {
      selectedAssignees.remove(assignee);
    }
    notifyListeners();
  }

  // Set and Clear Reporter
  void setReporter(Map<String, dynamic> selectedReporter) {
    reporter = selectedReporter;
    searchReporterController.clear(); // Clear input field
    _reporterUsers = []; // Clear search results after selection
    notifyListeners();
  }

  void clearReporter() {
    reporter = null;
    notifyListeners();
  }

  // Future<void> fetchUsers(String email) async {
  //   if (email.isEmpty) {
  //     _errorMessage = 'Please enter a valid email address.';
  //     _users = [];
  //     notifyListeners();
  //     return;
  //   }

  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();

  //   try {
  //     _users = await apiServices.listUsers(email: email.trim());
  //     _errorMessage = _users.isEmpty ? 'No users found.' : null;
  //   } catch (error) {
  //     _errorMessage = error.toString();
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // Fetch Users for Assignees
  Future<void> fetchAssignees(String query) async {
    if (query.isEmpty) {
      _assigneeErrorMessage = 'Please enter a valid query.';
      _assigneeUsers = [];
      notifyListeners();
      return;
    }

    _isAssigneeLoading = true;
    _assigneeErrorMessage = null;
    notifyListeners();

    try {
      _assigneeUsers = await apiServices.listUsers(email: query.trim());
      _assigneeErrorMessage = _assigneeUsers.isEmpty ? 'No users found.' : null;
    } catch (error) {
      _assigneeErrorMessage = error.toString();
    } finally {
      _isAssigneeLoading = false;
      notifyListeners();
    }
  }

  // Fetch Users for Reporter
  Future<void> fetchReporters(String query) async {
    if (query.isEmpty) {
      _reporterErrorMessage = 'Please enter a valid query.';
      _reporterUsers = [];
      notifyListeners();
      return;
    }

    _isReporterLoading = true;
    _reporterErrorMessage = null;
    notifyListeners();

    try {
      _reporterUsers = await apiServices.listUsers(email: query.trim());
      _reporterErrorMessage = _reporterUsers.isEmpty ? 'No users found.' : null;
    } catch (error) {
      _reporterErrorMessage = error.toString();
    } finally {
      _isReporterLoading = false;
      notifyListeners();
    }
  }

  // File Picker
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
// Fetch icons from the backend
Future<void> fetchIcons() async {
  _isLoading = true;
  notifyListeners();
  try {
    // Fetch the icons and update the list
    final List<dynamic> fetchedIcons = await apiServices.fetchIcons();
    // Parse the icons into a list of URLs or the required data structure
    _icons = fetchedIcons.map<String>((icon) => icon['iconName'] as String).toList();
  } catch (e) {
    _icons = []; // In case of error, clear the icons
  }
  _isLoading = false;
  notifyListeners();
}
  Future<void> uploadIcon(String filePath) async {
  try {
    await apiServices.uploadIcon(filePath);
    // After upload, fetch the latest icons
    await fetchIcons();  // Make sure this is awaited to ensure the icons are fetched before UI updates
  } catch (e) {
    print("Error uploading icon: $e");
  }
}

   // Handle icon selection
  void selectIcon(String iconID) {
    _selectedIconID = iconID;  // Set the selected icon ID
    notifyListeners();
  }
  // Add Project
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
        reporterId: reporter?['id'], // Use reporter's ID
        iconID: _selectedIconID!,
        projectDiscription: projectDiscriptionController.text.trim(),
        projectAssaignees:
            selectedAssignees.map((assignee) => assignee['id']).toList(),
        projectLinks: ["https://new.com", "https://new.com"], // Example links
        projectAttachments: selectedFiles,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project Added Successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add project: $e')),
      );
    }
  }
}
