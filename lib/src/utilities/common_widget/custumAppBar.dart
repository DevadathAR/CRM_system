import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class custumAppBar extends StatelessWidget {
  const custumAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // AppBar height
      child: VxBox(
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0), // Add padding to logo
            child: SvgPicture.asset(logoSvg,width: 30,height: 30,),
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
              icon: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // Remove default shadow
        ),
      )
          .margin(const EdgeInsets.all(16)) // Add margin around the AppBar
          .color(Colors.white) // Background color
          .withRounded(value: 24) // Rounded corners
          .shadow
          .make(),
    );
  }
}
