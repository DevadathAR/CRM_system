import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/features/employees/model/work.dart';
import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/features/employees/presentation/widget/pagination.dart';
import 'package:crm_system/src/features/profile/model/profiile_project_model.dart';
import 'package:crm_system/src/services/api_service.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class EmployeeActivity extends StatelessWidget {
  const EmployeeActivity({super.key});

Future<List<EmployeeData>> _fetchEmployiesData() async {
  // final apiService = ApiServices();
  final response = await ApiServices.fetchEmployees(
    limit: 10,
    page: 1,
  );

  // Extract the list of employees from the response
  return response.employees;  // Assuming 'employees' is the List<EmployeeData> in EmployeeResponse
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: FutureBuilder<List<EmployeeData>>(
          future: _fetchEmployiesData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No employees found'),
              );
            }

            final employees = snapshot.data!;
            return ListView(
              children: [
                _employeeActivityView(employees),
                const PaginationView(),  // Ensure PaginationView is defined
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _employeeActivityView(List<EmployeeData> employees) {
    return VStack(
      employees.map((employee) => _personDataBox(employee)).toList(),
    ).scrollVertical();
  }

  Widget _personDataBox(EmployeeData employee) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          WorkloadItem(
            level: employee.level,

          bgColor: AppColors.backgroindGrey1,
          name: employee.name, // Pass employee name
          role: employee.position, // Pass employee position
          dpImage: employee.avatar, // Pass employee avatar URL
          progressValue: double.parse(employee.taskProgress) / 100, // Convert task progress to a percentage (0.0 - 1.0)
        ),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _boxData(datum: '${employee.backlog}', label: backlog),
              _boxData(datum: '${employee.taskProgress}', label: taskProgress),
              _boxData(datum: '${employee.taskReview}', label: taskReview),
            ],
          ),
        ],
      ),
    );
  }

  Column _boxData({required String datum, required String label}) {
    return Column(
      children: [
        Text(
          datum,
          style: AppTextStyle.boldText(size: 26),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
        ),
      ],
    );
  }
}
