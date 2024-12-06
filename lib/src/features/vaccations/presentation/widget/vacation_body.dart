import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';

class VacationBody extends StatelessWidget {
  const VacationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (_) => const PersonDataBox()),
    );
  }
}

class PersonDataBox extends StatelessWidget {
  const PersonDataBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // Add shadow if needed
        // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              UserInfo(
                isExpanded: false,
                name: 'Evan Yates',
                role: 'evanyates@gmail.com',
                avatar: dp1png,
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoBox(label: 'Vacations', datum: '15'),
              Spacer(),
              InfoBox(label: 'Sick Leave', datum: '3'),
              Spacer(),
              InfoBox(label: 'Work remotely', datum: '50'),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final String datum;

  const InfoBox({super.key, required this.label, required this.datum});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textGrey1,
          ),
        ),
        Text(
          datum,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
