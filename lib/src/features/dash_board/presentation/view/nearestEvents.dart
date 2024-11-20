import 'package:crm_system/src/features/dash_board/presentation/widget/nearestEventsCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/sampleDatalists.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class NearesteventsPage extends StatelessWidget {
  const NearesteventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroindGrey2,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(arrowBackSvg),
                      10.widthBox,
                      Text(
                        "Back to Dashboard",
                        style: AppTextStyle.regularText(
                            size: 16, color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
                " Nearest Events"
                    .text
                    .textStyle(AppTextStyle.boldText(size: 22))
                    .make(),
              ],
            ).pSymmetric(h: 15),
            // Welcome Text Section
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: nearestEvents.length,
                itemBuilder: (context, index) {
                  return NearestEventsCard(
                    isnearestEvents: true,
                    event: nearestEvents[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
