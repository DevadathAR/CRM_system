import 'package:crm_system/src/features/employees/model/work.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  int currentPage = 1; // Start from page 1
  final int itemsPerPage = 8; // Number of items per page

  List<EmployeeData> _employees = []; // List of employees
  int _totalCount = 0; // Total number of employees
  bool _isLoading = false; // Loading state

  List<EmployeeData> get employees => _employees;
  int get totalCount => _totalCount;
  bool get isLoading => _isLoading;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  // Calculate the total number of pages
  int get totalPages => (_totalCount / itemsPerPage).ceil();

  // Get the range of items to display
 String get rangeText {
  int start = (currentPage - 1) * itemsPerPage + 1;
  int end = (currentPage * itemsPerPage) > _totalCount
      ? _totalCount
      : currentPage * itemsPerPage;
  
  // Calculate total pages by dividing _totalCount by 8 and rounding up
  int totalPages = (_totalCount / 8).ceil();

  return '$start-$end of $totalPages';
}


  // Update the selected index
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Handle "Previous" button click
  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      fetchEmployeesData(); // Fetch data for the previous page
    }
  }

  // Handle "Next" button click
  void nextPage() {
    if (currentPage < totalPages) {
      currentPage++;
      fetchEmployeesData(); // Fetch data for the next page
    }
  }

  // Fetch employees data from the API
  Future<void> fetchEmployeesData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiServices.fetchEmployees(
        limit: itemsPerPage,
        page: currentPage,
      );

      // Update the employees list and total count
      _employees = response.employees;
      _totalCount = response.totalCount; // Update total count based on API response
    } catch (e) {
      // Handle error if needed
      print('Error fetching employees: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}
