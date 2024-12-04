import 'dart:io';

import 'package:crm_system/dummy.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_1.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_2.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_3.dart';
import 'package:crm_system/src/features/authentication/presentation/view/sign_up_step_4.dart';
import 'package:crm_system/src/features/authentication/presentation/view/success.dart';
import 'package:crm_system/src/features/calendar/presentation/view/calander_page.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/dashboard.dart';
import 'package:crm_system/src/features/dash_board/presentation/view/nearestEvents.dart';
import 'package:crm_system/src/features/employees/presentation/view/employees_page.dart';
import 'package:crm_system/src/features/employees/presentation/view/employess_profile.dart';
import 'package:crm_system/src/features/profile/presentation/view/my_profile.dart';
import 'package:crm_system/src/features/profile/presentation/view/settings.dart';
import 'package:crm_system/src/features/projects/presentation/view/project_details.dart';
import 'package:crm_system/src/features/projects/presentation/view/projects_list.dart';
import 'package:crm_system/src/features/projects/presentation/view/task_details.dart';
import 'package:crm_system/src/features/vaccations/presentation/view/vacations.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/sign-in', // Start with the Sign In page
  routes: [
    GoRoute(
      path: '/sign-in',
      name: SignIn.route,
      pageBuilder: (context, state) =>
          getCustomTransition(state, const SignIn()),
      routes: [
        GoRoute(
          path: 'sign-up-step-1',
          name: SignupStep1.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const SignupStep1()),
        ),
        GoRoute(
          path: 'sign-up-step-2',
          name: SignUpStep2.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const SignUpStep2()),
        ),
        GoRoute(
          path: 'sign-up-step-3',
          name: SignUpStep3.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const SignUpStep3()),
        ),
        GoRoute(
          path: 'sign-up-step-4',
          name: SignUpStep4.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const SignUpStep4()),
        ),
        GoRoute(
          path: 'success',
          name: SuccessPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const SuccessPage()),
        ),
        GoRoute(
          path: 'dashboard',
          name: DashBoard.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const DashBoard()),
        ),
        GoRoute(
          path: 'nearest-event-page',
          name: NearesteventsPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const NearesteventsPage()),
        ),
        GoRoute(
          path: 'employees-page',
          name: Employees.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const Employees()),
        ),
        GoRoute(
          path: 'employee-profile',
          name: EmployessProfile.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const EmployessProfile()),
        ),
        GoRoute(
          path: 'calander_page',
          name: CalanderPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const CalanderPage()),
        ),
        GoRoute(
          path: 'vacation-page',
          name: VacationsPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const VacationsPage()),
        ),
        GoRoute(
          path: 'my-profile',
          name: MyProfile.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, MyProfile()),
        ),
        GoRoute(
          path: 'projects',
          name: ProjectsListPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const ProjectsListPage()),
        ),
        GoRoute(
          path: 'project_details',
          name: ProjectDetailsPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const ProjectDetailsPage()),
        ),
        GoRoute(
          path: 'Task_details',
          name: TaskDetailsPage.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const TaskDetailsPage()),
        ),
        GoRoute(
          path: 'settings',
          name: Settings.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state, const Settings()),
        ),
        GoRoute(
          path: 'dummy',
          name: Dummy.route,
          pageBuilder: (context, state) =>
              getCustomTransition(state,  Dummy()),
        ),
      ],
    ),
  ],
);

Page<dynamic> getCustomTransition(GoRouterState state, Widget child) {
  if (Platform.isIOS) {
    return CupertinoPage(
      key: UniqueKey(),
      child: child,
    );
  }
  return CustomTransitionPage(
    key: UniqueKey(),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
