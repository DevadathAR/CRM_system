import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get today's date
    final now = DateTime.now();
    final formattedDate =
        DateFormat('MMM dd, yyyy').format(now); // Format the date

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            // AppBar Section
            const custumAppBar(),

            // Welcome Text Section
            "Welcome back, Evan!"
                .text
                .size(16)
                .color(Appcolors.textGrey1)
                .make(),
            "Dashboard".text.bold.size(36).make(),
            10.heightBox,

            // Date Range Section
            Row(
              children: [
                SvgPicture.asset(calenderSvg),
                10.widthBox,
                Flexible(
                  child: "$formattedDate - $formattedDate"
                      .text
                      .size(16)
                      .overflow(TextOverflow.ellipsis)
                      .make(),
                ),
              ],
            ).box.rounded.p8.color(Appcolors.backgroindGrey1).make(),
            10.heightBox,

            // Workload Section with GridView
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workload Title Section
                  _buildWorkloadTitle(title: "Workload"),

                  10.heightBox,
                  // GridView inside ListView
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 180,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.0),
                    itemCount: 6, // Number of items
                    itemBuilder: (context, index) {
                      return const workloadItem();
                    },
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Grid inside ListView
                  ),
                ],
              ),
            ),
            10.heightBox,
            // Repeated Workload Title Section
            _buildWorkloadTitle(title: "Project"),

            ProjectCard(
              projectId: "PN0001265",
              projectName: "Medical App (iOS native)",
              creationDate: "Created Sep 12, 2020",
              priority: "Medium",
              priorityColor: Appcolors.yellow,
              allTasks: 34,
              activeTasks: 13,
              projectIcon: medicalAPpSvg,
            
            ),
            10.heightBox,
            const ProjectCard(
                projectId: "PN0001265",
                projectName: "Food Delivery Service",
                creationDate: "Created Sep 12, 2020",
                priority: "Low", // or "Low"
                priorityColor: Colors.green,
                allTasks: 34,
                activeTasks: 13,
                projectIcon: foodServiceSvg, // Your SVG path
                
                ),
          ],
        ),
      ),
    );
  }

  // Reusable method for Workload title section
  Widget _buildWorkloadTitle({title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.textStyle(AppTextStyle.boldText(size: 20)).make(),
        IconButton(
          onPressed: () {},
          icon: Row(
            children: [
              Text(
                "view all",
                style:
                    AppTextStyle.regularText(size: 16, color: Appcolors.blue),
              ),
              10.widthBox,
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 10,
                color: Appcolors.blue,
              )
            ],
          ),
        ),
      ],
    );
  }
}
