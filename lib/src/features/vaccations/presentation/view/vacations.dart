import 'package:crm_system/src/features/vaccations/presentation/widget/vacation_body.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class VacationsPage extends StatelessWidget {
  static const route = 'vacation-page';
  const VacationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawerWidget(),
      backgroundColor: AppColors.bgWhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1500),
        ),
        onPressed: () {},
        child: SvgPicture.asset(
          addSvg,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
      body: SafeArea(
        child: VStack(
          [
            const CustumAppBar(),
            24.heightBox,
            vacations.text
                .size(36)
                .color(AppColors.black)
                .bold
                .make()
                .pSymmetric(h: 24),
            8.heightBox,

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: VacationBody(),
            )
            
          ],
        ),
      ),
    );
  }

}
