// import 'package:crm_system/src/features/projects/presentation/view/project_details.dart';
// import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:velocity_x/velocity_x.dart';

// class TaskGroups extends StatelessWidget {
//   static const route = 'project_groups';

//   const TaskGroups({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustumScaffold(
//         body: Expanded(
//             child: ListView(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       children: [
//         20.heightBox,
//         "Projects".text.bold.size(36).make(),
//         10.heightBox,

//         /// jdbkbdfkhkhsdkfhskhf
//         _projectnameNid(ontap: () => context.goNamed(ProjectDetailsPage.route)),

//         15.heightBox,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             "Tasks".text.textStyle(AppTextStyle.boldText(size: 22)).make(),
//             SvgPicture.asset(
//               taskIconSvg,
//               color: AppColors.black,
//             )
//                 .box
//                 .withRounded(value: 14)
//                 .color(AppColors.white)
//                 .p12
//                 .make()
//                 .onTap(
//               () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const FilterDialog(),
//                 );
//               },
//             ),
//           ],
//         ),
//         10.heightBox,
//       ],
//     )));
//   }
// }
