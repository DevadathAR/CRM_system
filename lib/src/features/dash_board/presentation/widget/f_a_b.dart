import 'package:crm_system/src/features/authentication/presentation/view/sign_in.dart';
import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
import 'package:crm_system/src/features/projects/dummy.dart';
import 'package:crm_system/src/features/projects/presentation/view/projects_list.dart';
import 'package:crm_system/src/features/projects/presentation/widget/add_project_dialogue.dart';
import 'package:crm_system/src/features/projects/presentation/widget/add_task_dialogue.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/iconBox.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custumTile(
            title: "Project",
            imgpath: projectsIconsSvg,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AddProjectDialogue(),
              );
            }),
        custumTile(
            title: "Task",
            imgpath: taskiconScg,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AddTaskDialogue(),
              );
            }),
        custumTile(
            title: "Event",
            imgpath: eventIconSvg,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AddProjectDialogue(),
              );
            }),
        custumTile(title: "Request", imgpath: aeroplaneSvg, onTap: () {}),
        custumTile(
            title: "Employee",
            imgpath: addEmployeeIconSvg,
            onTap: () {
              context.pop();
              showDialog(
                context: context,
                builder: (context) => AddEmployees(),
              );
            }),
        // custumTile(title: "Folder to Info Portal", imgpath: folderIconSvg),
      ],
    );
  }

  ListTile custumTile(
      {required String title,
      required String imgpath,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: IconBox(
          icon: imgpath,
          iconColor: AppColors.blue,
          backgroundColor: AppColors.primaryBackGround),
      title: title.text
          .textStyle(
              AppTextStyle.regularText(size: 16, color: AppColors.lightblack))
          .make(),
    );
  }
}
