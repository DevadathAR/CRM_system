import 'package:crm_system/src/features/employees/model/work.dart';
import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/features/employees/presentation/widget/pagination.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/const.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

 Future<List<EmployeeData>> _fetchEmployiesInfo() async {
  // final apiService = ApiServices();
  final response = await ApiServices.fetchEmployees(
    limit: 10,
    page: 1,
  );

  // Return the list of employees from the response
  return response.employees;  // Assuming 'employees' is the List<EmployeeData> in EmployeeResponse
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<List<EmployeeData>>(
          future: _fetchEmployiesInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
             else if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );}
             else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No employees found'),
              );
            }

            final employees = snapshot.data!;
            return ListView(
              children: [
                _employeeListView(employees),
                const PaginationView(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _employeeListView(List<EmployeeData> employees) {
  return VStack(
    employees.map((employee) {
      return DataBox(
        name: employee.name,
        email: employee.email,
        avatar: employee.avatar ,
        gender: employee.gender,
        birthday: employee.dob,
        age: employee.age,
        position: employee.position,
        level: employee.level, 
      );
    }).toList(),
  ).scrollVertical();
}

}