import 'package:crm_system/src/features/projects/presentation/view/task_details.dart';
import 'package:flutter/material.dart';

class TeamLeadPage extends StatelessWidget {
  static const route = 'Team_lead';
  const TeamLeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TaskDetailsPage(),
    );
  }
}
