import 'package:crm_system/src/features/authentication/provider/signIn_provider.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/drawer.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustumScaffold extends StatelessWidget {
  // final String? route;
  final VoidCallback? ontap;

  final Widget body;
  CustumScaffold({
    super.key,
    required this.body,
    this.ontap,
    // this.route,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryBackGround,
      drawer: const AppDrawerWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: ontap,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustumAppBar(),
          body,
        ],
      )),
    );
  }
}
