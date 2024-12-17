import 'package:crm_system/src/features/vaccations/model/vaccation_model.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/userInfo.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class VacationBody extends StatelessWidget {
  final List<Message> messages;

  const VacationBody({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: messages.map((message) => PersonDataBox(message: message)).toList(),
    );
  }
}

class PersonDataBox extends StatelessWidget {
  final Message message;

  const PersonDataBox({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              UserInfo(
                isExpanded: false,
                name: message.requestedby.first.name,
                role: message.requestedby.first.email,
                avatar: dp1png, // Replace with a dynamic avatar if available
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoBox(label: 'Vacations', datum: message.vacationRequests),
              Spacer(),
              InfoBox(label: 'Sick Leave', datum: message.sickLeaveRequests),
              Spacer(),
              InfoBox(label: 'Work remotely', datum: message.wfhRequests),
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
