import 'package:crm_system/src/features/dash_board/presentation/widget/nearestEventsCard.dart';
import 'package:crm_system/src/features/dash_board/presentation/widget/sampleDatalists.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class NearesteventsPage extends StatelessWidget {
  static const route = 'nearest-event-page';
  const NearesteventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      // Scaffold(
      //   backgroundColor: AppColors.primaryBackGround,
      //   floatingActionButton: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: AppColors.blue,
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      //       child: SvgPicture.asset(
      //         addSvg,
      //         colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      //       ),
      //     ),
      //   ),
      body: Column(
        children: [
          // AppBar Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustumIconButton(
                  isPrefix: true,
                  buttonTItle: "Back to Dashboard",
                  icon: arrowBackSvg,
                  onTap: () {
                     context.pop();
                  }),
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
    );
  }
}
