
import 'package:crm_system/src/features/employees/presentation/view/employees_page.dart';
import 'package:crm_system/src/features/employees/presentation/view/employess_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: EmployessProfile());
  }
}
