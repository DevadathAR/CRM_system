// import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
// import 'package:crm_system/src/features/authentication/provider/signIn_provider.dart';
// import 'package:crm_system/src/features/projects/provider/project_Provider.dart.dart';
// import 'package:crm_system/src/features/vaccations/presentation/widget/multy_date_calendar.dart';
// import 'package:crm_system/src/features/dash_board/provider/add_event_provider.dart';
// import 'package:crm_system/src/features/dash_board/provider/dashboardProvider.dart';
// import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
// import 'package:crm_system/src/features/profile/provider/pageview_provider.dart';
// import 'package:crm_system/src/features/vaccations/provider/vacation_provider.dart';
// import 'package:crm_system/src/services/routeServices.dart';
// import 'package:crm_system/src/utilities/provider/textfeild_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => SigninProvider()),
//         ChangeNotifierProvider(create: (_) => ProjectsProvider()),
//         ChangeNotifierProvider(create: (_) => DashbordProvider()),
//         ChangeNotifierProvider(create: (_) => EmployeeProvider()),
//         ChangeNotifierProvider(create: (_) => MultipleDatePickerProvider()),
//         ChangeNotifierProvider(create: (_) => PageSelectionProvider()),
//         ChangeNotifierProvider(create: (_) => RepeatEventProvider()),
//         ChangeNotifierProvider(create: (_) => VacationProvider()),
//         ChangeNotifierProvider(create: (_) => FormStateNotifier()),
//       ],
//       child: const MainApp(),
//     ),
//   );
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerDelegate: router.routerDelegate, // GoRouter navigation
//       routeInformationParser: router.routeInformationParser,
//       routeInformationProvider: router.routeInformationProvider,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }

import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/authentication/provider/auth_provider.dart';
import 'package:crm_system/src/features/authentication/provider/signIn_provider.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/features/projects/provider/project_Provider.dart.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/multy_date_calendar.dart';
import 'package:crm_system/src/features/dash_board/provider/add_event_provider.dart';
import 'package:crm_system/src/features/dash_board/provider/dashboardProvider.dart';
import 'package:crm_system/src/features/employees/provider/employee_provider.dart';
import 'package:crm_system/src/features/profile/provider/pageview_provider.dart';
import 'package:crm_system/src/features/vaccations/provider/vacation_provider.dart';
import 'package:crm_system/src/services/routeServices.dart';
import 'package:crm_system/src/utilities/provider/textfeild_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check login status
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MyApp(isLoggedIn: isLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => ProjectsProvider()),
        ChangeNotifierProvider(create: (_) => DashbordProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider(create: (_) => MultipleDatePickerProvider()),
        ChangeNotifierProvider(create: (_) => PageSelectionProvider()),
        ChangeNotifierProvider(create: (_) => RepeatEventProvider()),
        ChangeNotifierProvider(create: (_) => VacationProvider()),
        ChangeNotifierProvider(create: (_) => FormStateNotifier()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Use the initial route based on login status
        builder: (context, child) {
          final initialRoute = isLoggedIn ? DashBoard.route : SignIn.route;
          router.goNamed(initialRoute); // Redirect user
          return child!;
        },
      ),
    );
  }
}
