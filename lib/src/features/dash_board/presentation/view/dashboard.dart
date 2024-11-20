import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/sampleDatalists.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/workLoadItem.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/acivityCard.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: SvgPicture.asset(
            addSvg,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Section
            const custumAppBar(),
            // Welcome Text Section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  "Welcome back, Evan!"
                      .text
                      .size(16)
                      .color(AppColors.textGrey1)
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
                  ).box.rounded.p8.color(AppColors.backgroindGrey1).make(),
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
                        _buildTitle(title: "Workload"),

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
                  _buildTitle(title: "Project"),

                  ProjectCard(
                    projectId: "PN0001265",
                    projectName: "Medical App (iOS native)",
                    creationDate: "Created Sep 12, 2020",
                    priority: "Medium",
                    priorityColor: AppColors.yellow,
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
                  _buildTitle(title: "Nearest Events"),
                  SizedBox(
                    height: 130, // Adjust to match the card's height
                    child: PageView.builder(
                      controller:
                          PageController(), // Slight padding for adjacent cards
                      itemCount: nearestEvents.length, // List of nearest events
                      itemBuilder: (context, index) {
                        return nearestEventsCard(nearestEvents[index]);
                      },
                    ),
                  ),
                  10.heightBox,
                  const ActivityCard(),
                  20.heightBox,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget nearestEventsCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 4), // Add spacing between cards
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.blue,
            ),
          ),
          10.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: event['title']
                          .toString()
                          .text
                          .maxLines(2)
                          .overflow(TextOverflow.ellipsis)
                          .textStyle(AppTextStyle.boldText(size: 16))
                          .make(),
                    ),
                    SvgPicture.asset(arrowUpSvg),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "${event['date']} | ${event['time']}"
                        .text
                        .textStyle(AppTextStyle.regularText(
                            size: 14, color: AppColors.textGrey2))
                        .make(),
                    Row(
                      children: [
                        SvgPicture.asset(clockSvg),
                        5.widthBox,
                        "${event['duration']}h"
                            .text
                            .textStyle(AppTextStyle.boldText(
                                size: 12, color: AppColors.textGrey1))
                            .make(),
                      ],
                    ).box.p8.rounded.color(AppColors.backgroindGrey2).make(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable method for Workload title section
  Widget _buildTitle({title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.textStyle(AppTextStyle.boldText(size: 22)).make(),
        const CustumIconButton(
          buttonTItle: "View all",
          icon: Icons.arrow_forward_ios_outlined,
        ),
      ],
    );
  }
}
