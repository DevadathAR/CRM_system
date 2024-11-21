import 'package:crm_system/src/features/employees/presentation/view/employess_profile.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class CustumAppBar extends StatelessWidget {
  const CustumAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // AppBar height
      child: VxBox(
        child: AppBar(
             backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // Remove default shadow

          leading: Padding(
              padding: const EdgeInsets.all(8.0), // Add padding to logo
              child: SvgPicture.asset(
                logoSvg,
                width: 30,
                height: 30,
              )).onTap(
            () {
              Scaffold.of(context).openDrawer(); // Open the Drawer
            },
          ),
          actions: [
            // SVG icon for search
            IconButton(
              icon: SvgPicture.asset(search,
                  width: 24, height: 24), // Replace with your SVG path
              onPressed: () {},
            ),
            // SVG icon for notifications
            IconButton(
              icon: SvgPicture.asset(bellSvg,
                  width: 24, height: 24), // Replace with your SVG path
              onPressed: () {},
            ),
            // SVG icon for more options
            IconButton(
              icon: CircleAvatar(
                child: Image.asset(dp1png),
              ),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EmployessProfile(),));},
            ),
          ],
       
        ),
      )
          .margin(const EdgeInsets.all(16)) // Add margin around the AppBar
          .color(AppColors.white) // Background color
          .withRounded(value: 24) // Rounded corners
          .shadowXs
          .make(),
    );
  }
}
