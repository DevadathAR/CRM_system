import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumAppBar.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class VacationsPage extends StatelessWidget {
  const VacationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const custumAppBar(),
            24.heightBox,
            vacations.text
                .size(36)
                .color(AppColors.black)
                .bold
                .make()
                .pSymmetric(h: 24),
            8.heightBox,
            VStack(
              [
                ...List.generate(8, (_) => _personDataBox()),
              ],
            ).scrollVertical().expand(),
          ],
        ),
      ),
    );
  }

  Widget _personDataBox() {
    return VStack(
      [
        const HStack(
          [
            UserInfo(
                name: 'Evan Yates', role: 'evanyates@gmail.com', avatar: dp1png)
          ],
        ),
        const Divider(),
        HStack(
          [
            _infoBox(label: 'Vacations', datum: '15'),
            const Spacer(),
            _infoBox(label: 'Sick Leave', datum: '3'),
            const Spacer(),
            _infoBox(label: 'Work remotely', datum: '50'),
          ],
          alignment: MainAxisAlignment.spaceBetween,
        ),
      ],
      alignment: MainAxisAlignment.spaceAround,
    )
        .box
        .white
        .roundedLg
        .shadow
        .p16
        .margin(const EdgeInsets.symmetric(horizontal: 20, vertical: 12))
        .height(190)
        .make();
  }

  Widget _infoBox({required String label, required String datum}) {
    return VStack(
      [
        label.text.size(14).color(AppColors.grey).make(),
        datum.text.size(16).color(AppColors.black).make(),
      ],
      crossAlignment: CrossAxisAlignment.start,
    );
  }
}
