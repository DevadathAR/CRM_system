import 'package:crm_system/src/features/employees/presentation/widget/data_box.dart.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: ListView(
          children: [
            _employeeListView(), 
          ],
        ),
      ),
    );
  }

  Widget _employeeListView() {
    return VStack(
      List.generate(8, (_) => _personDataBox()),
    ).scrollVertical(); 
  }

  Widget _personDataBox() {
    return const DataBox();
  }
}
