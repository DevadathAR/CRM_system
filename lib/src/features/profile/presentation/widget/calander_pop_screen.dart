import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CalanderPopScreen extends StatelessWidget {
  const CalanderPopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      
      child: Expanded(child: Container(height: 200,color: AppColors.blue,)),
    );
  }
}