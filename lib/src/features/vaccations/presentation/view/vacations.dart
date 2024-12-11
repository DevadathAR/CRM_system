
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_req_popup.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VacationsPage extends StatelessWidget {
  static const route = 'vacation-page';
  const VacationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      ontap: () {
        showDialog(
          context: context,
          builder: (context) => VacationRequest()
        );
      },
      body: VStack(
        [
          vacations.text
              .color(AppColors.black)
              .textStyle(AppTextStyle.boldText(size: 36))
              .make()
              .pSymmetric(h: 24),
          8.heightBox,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: VacationBody(),
          )
        ],
      ),
    );
  }
}
