import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';

class SelectTaskStatus extends StatefulWidget {
  final Function(String selectedValue) onSelectionChanged;

  const SelectTaskStatus({
    super.key,
    required this.onSelectionChanged,
  });

  @override
  State<SelectTaskStatus> createState() => _SelectTaskStatusState();
}

class _SelectTaskStatusState extends State<SelectTaskStatus> {
  String groupValue = "ToDo";
  void onChanged(String? value) {
    setState(() {
      groupValue = value!;
      widget.onSelectionChanged(groupValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          activeColor: AppColors.blue,
          value: "ToDo",
          groupValue: groupValue,
          onChanged: onChanged,
          title: valueText("To Do"),
        ),
        RadioListTile<String>(
          activeColor: AppColors.blue,
          value: "InProgress",
          groupValue: groupValue,
          onChanged: onChanged,
          title: valueText("In Progress"),
        ),
        RadioListTile<String>(
          activeColor: AppColors.blue,
          value: "In Review",
          groupValue: groupValue,
          onChanged: onChanged,
          title: valueText("In Review"),
        ),
        RadioListTile<String>(
          activeColor: AppColors.blue,
          value: "Done",
          groupValue: groupValue,
          onChanged: onChanged,
          title: valueText("Done"),
        ),
      ],
    );
  }

  Text valueText(text) => Text(
        text,
        style: AppTextStyle.regularText(size: 14, color: AppColors.lightblack),
      );
}
