import 'package:crm_system/src/features/profile/presentation/widget/expantion_tile.dart';
import 'package:crm_system/src/utilities/common_widget/customCheckBox.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';



class Settings extends StatefulWidget {
  static String route = 'settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> { 
  // To track the expanded tile
  final ValueNotifier<Key?> _expandedItem = ValueNotifier<Key?>(null);
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      body: Expanded(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24.0, right: 24, left: 24, bottom: 16),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustumIconButton(
                  isPrefix: true,
                  buttonTItle: "Back to Profile",
                  icon: arrowBackSvg,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              16.heightBox,
              // Title
              Text(
                'Settings',
                style: AppTextStyle.boldText(size: 22, color: AppColors.black),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: AppColors.white),
                child: Column(
                  children: [
                    CustomExpansionTile(
                      key: const Key('tile_1'),
                      label: 'Account',
                      icon: accountsvg
                      ,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_2'),
                      label: 'Notification',
                      icon: greynotiSvg,
                      expandedItem: _expandedItem,
                      children: [
                        Column(
                          children: [
                            _notificationBox(
                                header: 'Issue Activity',
                                data:
                                    'Send me email notifications for issue activity'),
                            16.heightBox,
                            _notificationBox(
                                header: 'Tracking Activity',
                                data:
                                    'Send me notifications when someone’ve tracked time in tasks'),
                            16.heightBox,
                            _notificationBox(
                                header: 'New Comments',
                                data:
                                    'Send me notifications when someone’ve sent the comment'),
                            16.heightBox,
                            HStack(
                              [
                                Customcheckbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value ?? false;
                                    });
                                  },
                                ),
                                10.widthBox,
                                Flexible(
                                  child: Text(
                                    "Don't send me notifications after 9:00 PM",
                                    softWrap: true,
                                    style: AppTextStyle.regularText(
                                        size: 16, color: AppColors.black),
                                  ),
                                )
                              ],
                            ).px16(),
                          ],
                        )
                      ],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_3'),
                      label: 'My Company',
                      icon: mycompSvg,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_4'),
                      label: 'Connected Apps',
                      icon: connectedSvg,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_5'),
                      label: 'Payments',
                      icon: paymentSvg,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_6'),
                      label: 'Confidentaility',
                      icon: confidentalitySvg,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                    CustomExpansionTile(
                      key: const Key('tile_7'),
                      label: 'Safety',
                      icon: safetySvg,
                      expandedItem: _expandedItem,
                      children: [Text('data')],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  StatefulBuilder _notificationBox({header, data}) {
    bool isToggled = false; // Local state variable for toggle switch

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            color: AppColors.bgWhite,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12), // Add padding for better appearance
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between text and toggle
            children: [
              Flexible(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        style: AppTextStyle.boldText(
                            size: 14, color: AppColors.black),
                      ),
                      SizedBox(
                          height: 4), // Add spacing between title and subtitle
                      Text(
                        softWrap: true,
                        data,
                        style: AppTextStyle.regularText(
                            size: 12, color: AppColors.textGrey1),
                      ),
                    ],
                  ),
                ),
              ),
              Switch(
                value: isToggled,
                activeColor: AppColors.blue, // Customize active toggle color
                onChanged: (bool value) {
                  setState(() {
                    isToggled = value; // Update the toggle state
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
