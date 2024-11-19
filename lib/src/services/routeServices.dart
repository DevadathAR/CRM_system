// import 'dart:io';

// import 'package:flocklink/src/features/authentication/presenation/view/church_codepage.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/create_password_view.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/forgot_password_view.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/login.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/otp_page.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/signup.dart';
// import 'package:flocklink/src/features/authentication/presenation/view/splash_screen.dart';
// import 'package:flocklink/src/features/event/presentation/view/event.dart';
// import 'package:flocklink/src/features/event/presentation/view/event_details.dart';
// import 'package:flocklink/src/features/group/presentation/view/group.dart';
// import 'package:flocklink/src/features/group/presentation/view/group_details.dart';
// import 'package:flocklink/src/features/group/presentation/view/group_posts.dart';
// import 'package:flocklink/src/features/group/presentation/view/post_details.dart';
// import 'package:flocklink/src/features/home/presentation/view/home.dart';
// import 'package:flocklink/src/features/home/presentation/view/scaffold_builder.dart';
// import 'package:flocklink/src/features/more/others/presentation/view/church_Info.dart';
// import 'package:flocklink/src/features/more/user/presentation/views/family_Info.dart';
// import 'package:flocklink/src/features/more/user/presentation/views/family_detailed_info.dart';
// import 'package:flocklink/src/features/more/user/presentation/views/personal_Info.dart';
// import 'package:flocklink/src/features/more/others/presentation/view/request_service.dart';
// import 'package:flocklink/src/features/notifications/presentation/view/notification_detailed.dart';
// import 'package:flocklink/src/features/notifications/presentation/view/notifications.dart';
// import 'package:flocklink/src/utilities/const.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// final router = GoRouter(
//   initialLocation: '/${SplashScreen.route}',
//   routes: [
//     GoRoute(
//       path: HomePage.route,
//       name: HomePage.route,
//       pageBuilder: (context, state) =>
//           getCustomTransition(state, const HomePage()),
//       routes: [
//         GoRoute(
//           path: SplashScreen.route,
//           name: SplashScreen.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const SplashScreen()),
//         ),
//         // GoRoute(
//         //   path: ChurchCodePage.route,
//         //   name: ChurchCodePage.route,
//         //   pageBuilder: (context, state) =>
//         //       getCustomTransition(state, const ChurchCodePage()),
//         // ),
//         // GoRoute(
//         //   path: LogIn.route,
//         //   name: LogIn.route,
//         //   pageBuilder: (context, state) =>
//         //       getCustomTransition(state, const LogIn()),
//         // ),
//         GoRoute(
//           path: SignUp.route,
//           name: SignUp.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const SignUp()),
//         ),
//         GoRoute(
//           path: ForgotPassword.route,
//           name: ForgotPassword.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const ForgotPassword()),
//         ),
//         GoRoute(
//           path: OTPpage.route,
//           name: OTPpage.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, OTPpage()),
//         ),
//         GoRoute(
//           path: CreatePasswordPage.route,
//           name: CreatePasswordPage.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const CreatePasswordPage()),
//         ),
//         GoRoute(
//           path: Group.route,
//           name: Group.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const Group()),
//           routes: const [],
//         ),
//         GoRoute(
//           path: GroupPosts.route,
//           name: GroupPosts.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const GroupPosts()),
//         ),
//         GoRoute(
//           path: AboutGroup.route,
//           name: AboutGroup.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const AboutGroup()),
//         ),
//         GoRoute(
//           path: PostDetails.route,
//           name: PostDetails.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const PostDetails()),
//         ),
//         GoRoute(
//           path: Event.route,
//           name: Event.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const Event()),
//         ),
//         GoRoute(
//           path: Eventdetails.route,
//           name: Eventdetails.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const Eventdetails()),
//         ),
//         GoRoute(
//           path: PersonalInfoPage.route,
//           name: PersonalInfoPage.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const PersonalInfoPage()),
//         ),
//         GoRoute(
//           path: ChurchInfoPage.route,
//           name: ChurchInfoPage.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const ChurchInfoPage()),
//         ),
//         GoRoute(
//           path: FamilyInfo.route,
//           name: FamilyInfo.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const FamilyInfo()),
//         ),
//         GoRoute(
//           path: FamilyDetailedInfo.route,
//           name: FamilyDetailedInfo.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const FamilyDetailedInfo()),
//         ),
//         GoRoute(
//           path: RequestService.route,
//           name: RequestService.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const RequestService()),
//         ),
//         GoRoute(
//           path: NotificationPage.route,
//           name: NotificationPage.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const NotificationPage()),
//         ),
//         GoRoute(
//           path: NotificationDetailed.route,
//           name: NotificationDetailed.route,
//           pageBuilder: (context, state) =>
//               getCustomTransition(state, const NotificationDetailed()),
//         ),
//       ],
//     ),
//   ],
// );

// Page<dynamic> getCustomTransition(GoRouterState state, Widget child) {
//   // if (Platform.isAndroid) {
//   //   return MaterialPage(
//   //     key: UniqueKey(),
//   //     child: child,
//   //   );
//   // }
//   if (Platform.isIOS) {
//     return CupertinoPage(
//       key: UniqueKey(),
//       child: child,
//     );
//   }
//   return CustomTransitionPage(
//     key: UniqueKey(),
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       // Change the opacity of the screen using a Curve based on the the animation's
//       // value
//       return FadeTransition(
//         opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
//         child: child,
//       );
//     },
//   );
// }
