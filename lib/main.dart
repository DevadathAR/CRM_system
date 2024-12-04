import 'package:crm_system/dummy.dart';
import 'package:crm_system/src/features/dash_board/provider/add_event_provider.dart';
import 'package:crm_system/src/features/dash_board/provider/dashboardProvider.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/features/profile/provider/pageview_provider.dart';
import 'package:crm_system/src/services/routeServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashbordProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        // ChangeNotifierProvider(create: (_) => PageviewProvider()),
        ChangeNotifierProvider(create: (_) => PageSelectionProvider()),
        ChangeNotifierProvider(create: (_) => RepeatEventProvider()),
      ],

      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate, // GoRouter navigation
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
